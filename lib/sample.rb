class CasesController < ApplicationController
  include SimpleStomp::Helper

  layout 'print', only: [:print]

  before_action :authenticate_user!
  load_and_authorize_resource
  skip_load_resource only: [:new, :search]
  load_resource :patient, through: :case, singleton: true, only: [:show, :predict, :print]
  autocomplete :patient, :hospitalization_number, :full => true, :display_value => :s_method,
               :extra_data =>[:id, :name, :hospitalization_number, :attend_doctor]
  autocomplete :patient, :name, :full=> true, :display_value => :s_method,
               :extra_data =>[:id, :name, :hospitalization_number, :attend_doctor]

  def edit_result
    @result = Result.find(params[:result_id])
    render partial: 'results/form', locals: {result: @result, remote: true}, layout: false
  end

  def retrieve
    @date = @case.discuss_at.to_date
    @cases = Case.where('date(discuss_at) = ?', @date).accessible_by(current_ability)

    timestamp = Time.now.to_f.to_s
    cond = {timestamp: timestamp,
            case_ids: @cases.each_with_object([]){|c, ids| ids << c.id if c.status != :finished } }
    msg = {body: cond.to_json}
    recv = send_receive msg, subscribe_header: selector(timestamp: timestamp), timelimit:3
    case recv['status']
      when 'ok'
        @cases.each do |c|
          c.status = recv[c.id.to_s]['status'] if c.status != :finished
        end
        @progress = recv
        @case.status = recv[@case.id.to_s]['status'] if @case.status != :finished
        @vote = @case.votes.where(user_id: current_user.id).first
        @side_result = @case.side_result || @case.build_side_result
        @syn_result = @case.syn_result || @case.build_syn_result if @case.patient.is_bilateral?
        render json: { 'side-bar': render_to_string('_side_nav', layout: false),
                       'operations': render_to_string('_operations', layout: false) }
      else # error
        @err_msg = recv['error']
        err_html = render_to_string 'shared/_wf_error', layout: false
        render json: { 'side-bar': err_html, 'operations': err_html }
    end
  end

  def abstract
    render :abstract, layout: false
  end

  def index
    @q = Case.ransack(params[:q])
    @cases = (params[:q].present? ? @q.result : Case).accessible_by(current_ability)

    @cases = @cases.all_of_unfinished_dates.order('discuss_at desc, created_at asc').page(params[:page])
  end

  def search
    @q = Case.ransack(params[:q])
    @cases = (params[:q].present? ? @q.result : Case).accessible_by(current_ability)

    respond_to do |format|
      format.html { @cases = @cases.order(discuss_at: :desc).page(params[:page]) }
      if current_user.superadmin?
        format.csv do
          filename = "MDT-Cases-#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
          send_data export, :type => 'text/csv; header=present', :filename => filename
        end
      end
    end

  end

  def show
    @side = @patient.send "#{@case.side}_side"
    @vote = @case.votes.where(user_id: current_user.id).first
    @side_result = @case.side_result || @case.build_side_result
    @syn_result = @case.syn_result || @case.build_syn_result if @patient.is_bilateral?
    @recommend_list = show_predict(@patient)
  end

  def result
    @votes = @case.votes
    if params[:therapy_type]
      render json: count_votes(@votes, params[:therapy_type])
    else
      render '_result', layout: false
    end
  end

  def predict
    hn = @patient.hospitalization_number
    #@evaluation = Evaluate::Eval.new(hn).evaluate()
    @evaluation = Evalrefine::Eval.new(hn).evaluate()

    if !@patient.imported?
      render '_predict_nil', layout: false

    elsif @case.is_passing_stat? || @patient.stat.nil?
      render '_predict_rule', layout: false

    else
      @predict, related_pids = [:ct, :rt, :et, :tt].each_with_object([{}, []]) do |t, obj|
        (obj.first[t] = @patient.stat.recommend("#{t}_scheme")).each do |s|
          obj.second.concat s.second.second
        end
      end

      related_pids.uniq!
      @related_patients =  Patient.find(related_pids).each_with_object({}) { |p, obj| obj[p.id] = p }
      render '_predict', layout: false
    end
  end

  def new
    @date = (Case.select('MAX(discuss_at) as max_date').first.try(:max_date) || Date.today).to_date
    @cases = Case.where('date(discuss_at) = ?', @date)

    init = if !@cases.empty?
             [:discuss_at, :place, :attending_id, :nurse_id, :user_ids,
              :recorder_id, :moderator_id] .each_with_object({}) {|col, obj| obj[col] = @cases.first.send(col)}
           else
             {}
           end

    @case = Case.new init
  end

  def create
    doctor_ids_params.each do |id|
      @case.votes << Vote.new( user_id: id )
    end

    if @case.save
      # send initialization message
      msg = {body: {case_id: @case.id, user_ids: @case.user_ids}.to_json }
      recv = send_receive msg, subscribe_header: selector(case_id: @case.id)

      case recv['status']
        when 'ok'
          @case.update status: :started
          redirect_to( {action: :new}, notice: ct('notice.created', obj: Case.model_name.human) )
        else # error
          logger.error "workflow: #{recv['error']}"
          redirect_to( {action: :new}, alert: recv['error'] )
      end

    else
      @cases = Case.where('date(discuss_at) = ?', @case.discuss_at)
      render :new
    end
  end

  def edit
    @date = (Case.select('MAX(discuss_at) as max_date').first.try(:max_date) || Date.today).to_date
    @cases = Case.where('date(discuss_at) = ?', @date)
  end

  def update
    doctor_ids_to_add, doctor_ids_to_drop = [], []

    if @case.status == :started || @case.status == :first_finished
      attended_doctor_ids = @case.doctors_attended.map{|d| d.id}
      destroyable_doctor_ids = @case.votes_destroyable.map{|v| v.user_id}
      doctor_ids_to_alter = doctor_ids_params
      doctor_ids_to_add = doctor_ids_to_alter - attended_doctor_ids
      doctor_ids_to_drop =  destroyable_doctor_ids - doctor_ids_to_alter
    end

    if doctor_ids_to_add.empty? && doctor_ids_to_drop.empty?
      if @case.update update_params
        redirect_to( {action: :index}, notice: ct('notice.updated', obj: Case.model_name.human) )
      else
        render :edit
      end
    else
      msg = {body: {case_id: @case.id, doctor_ids_to_add: doctor_ids_to_add, doctor_ids_to_drop: doctor_ids_to_drop}.to_json}
      recv = send_receive msg, subscribe_header: selector(case_id: @case.id)
      case recv['status']
        when 'ok'
          @case.attributes = update_params
          @case.votes.create(doctor_ids_to_add.map{|d_id| {user_id: d_id}})
          @case.users.destroy(*doctor_ids_to_drop)

          if @case.save
            redirect_to( {action: :index}, notice: ct('notice.updated', obj: Case.model_name.human) )
          else
            render :edit
          end
        else
          logger.error "workflow: #{recv['error']}"
          redirect_to( {action: :index}, alert: recv['error'] )
      end
    end
  end

  def destroy
    @case.destroy

    cond = {case_id: @case.id}
    msg = {body: cond.to_json}
    recv = send_receive msg, subscribe_header: selector(cond), timelimit:15

    case recv['status']
      when 'ok'
        redirect_to( {action: :index}, notice: ct('notice.deleted', obj: Case.model_name.human) )
      else
        logger.error "workflow: #{recv['error']}"
        redirect_to( {action: :index}, alert: recv['error'] )
    end
  end

  def proceed
    cond = {case_id: @case.id}
    msg = {body: cond.to_json, header: cond}
    recv = send_receive msg, subscribe_header: selector(cond), timelimit:15

    case recv['status']
      when 'ok'
        @case.update_attribute :status, :second_started
        redirect_to case_path(@case), notice: ct('notice.proceeded')
      else
        logger.error "workflow: #{recv['error']}"
        redirect_to case_path(@case), alert: recv['error']
    end
  end

  def force_proceed
    @case.votes.each do |v|
      v.abstain_if_not_vote(:first)
      v.save
    end

    proceed
  end

  def finish
    if @case.side_result.nil?
      redirect_to case_path(@case), alert: ct('alert.result_unrecorded')
    elsif !@case.side_result.recordable? || (!@case.syn_result.nil? && !@case.syn_result.recordable?)
      redirect_to case_path(@case), alert: ct('alert.result_not_recordable')
    else
      cond = {case_id: @case.id}
      msg = {body: cond.to_json, header: cond}
      recv = send_receive msg, subscribe_header: selector(cond)
      case recv['status']
        when 'ok'
          if @case.is_into_stat? && @case.patient.imported? && !@case.patient.stat.nil?
            @case.patient.stat.update @case.side_result.map_therapy_for_stat
          end
          @case.update status: :finished
          redirect_to case_path(@case), notice: ct('notice.finished')
        when 'error'
          logger.error "workflow: #{recv['error']}"
          redirect_to case_path(@case), alert: recv['error']
      end
    end
  end


  def force_finish
    @case.votes.each do |v|
      v.abstain_if_not_vote(:second)
      v.save
    end

    finish
  end

  def print
    @side = @patient.send "#{@case.side}_side"
    @side_result = @case.side_result
    @syn_result = @case.syn_result if @patient.is_bilateral?
  end

  private
  def show_predict(patient)
    #for validating vote

    if !patient.imported?
      @recommend_list = Hash(is_ok: false, ct: [], rt: [], et: [], tt: [])
    elsif @case.is_passing_stat? || @patient.stat.nil?
      @recommend_list = eval_list(patient)
    else
      @recommend_list = eval_list(patient)
      @recommend_list[:is_ok] = true
      predict, related_pids = [:ct, :rt, :et, :tt].each_with_object([{}, []]) do |t, obj|
        (obj.first[t] = patient.stat.recommend("#{t}_scheme")).each do |s|
          obj.second.concat s.second.second
        end
      end
      tc = [Chemotherapy, Radiotherapy, EndocrineTherapy, TargetedTherapy]
      [:ct, :rt, :et, :tt].each_with_index do |t,i|
        predict[t].first(2).each do |s|
          tc[i].with_therapy_for_stat(s.first.to_s).each do |v|
            @recommend_list[t] << v.name if !(@recommend_list[t].include?(v.name))
          end
        end
      end
    end
    if @recommend_list[:ct].length + @recommend_list[:rt].length + @recommend_list[:et].length + @recommend_list[:tt].length == 0
      @recommend_list[:is_ok] = false
    end

    tc = [Chemotherapy, Radiotherapy, EndocrineTherapy, TargetedTherapy]
    [:ct, :rt, :et, :tt].each_with_index do |t,i|
      if @recommend_list[:is_ok] && @recommend_list[t] == []
        @recommend_list[t] = tc[i].all.map { |tt| tt.name}
      end
    end
    @recommend_list
  end

  def eval_list(patient)
    @recommend_list = Hash(is_ok: true, ct: [], rt: [], et: [], tt: [])
    hn = patient.hospitalization_number
    evaluation = Evalrefine::Eval.new(hn).evaluate()
    nccn = evaluation[:nccn][:cancer0]
    rj_eval = evaluation[:rj_eval][:cancer0]
    tc = [Chemotherapy, Radiotherapy, EndocrineTherapy, TargetedTherapy]
    [:ct, :rt, :et, :tt].each_with_index do |t,i|
      if !nccn[:flag][t] && !rj_eval[:flag][t]
        @recommend_list[:is_ok]=false
      else
        if nccn[:flag][t]
          nccn[t].each do |x|
            if t == :tt && x == :need
              @recommend_list[t] = tc[i].all.map { |tt| tt.name}
              @recommend_list[t].delete('不需要')
              @recommend_list[t].delete('待定')
            end
            tc[i].with_therapy_for_stat(x).each do |v|
              @recommend_list[t] << v.name if !(@recommend_list[t].include?(v.name))
            end
          end
        end
        if rj_eval[:flag][t]
          rj_eval[t].each do |x|
            tc[i].with_therapy_for_stat(x).each do |v|
              @recommend_list[t] << v.name if !(@recommend_list[t].include?(v.name))
            end
          end
        end
      end
    end
    @recommend_list
  end

  def create_params
    params.require(:case).permit(
        :sponsor_id, :nurse_id, :attending_id, :recorder_id, :patient_id, :moderator_id,
        :discuss_at, :place, :side, :category, :is_passing_stat, :is_into_stat
    )
  end

  def update_params
    params.require(:case).permit(
        :discuss_at, :place, :nurse_id, :attending_id, :recorder_id, :moderator_id, :category,
        :is_passing_stat, :is_into_stat
    )
  end

  def doctor_ids_params
    params.require(:case).permit(user_ids: [])[:user_ids].reject(&:empty?).map{|attr| attr.to_i}
  end

  def export
    # tables = %w(votes patient side_result syn_result)
    # @cases.each_with_object(Export.header_for_export(tables).join(',') + "\n") do |c, str|
    #   str.concat c.to_csv(tables, split: false)
    # end
    attr_str = Export.vote_header_for_export()
    @cases.each do |c|
      attr_str += c.to_vote_csv()
    end
    return attr_str
  end

 def count_votes(votes, therapy)
    raw = votes.each_with_object(Hash.new{|hsh, key| hsh[key] = {}}) do |v, counter|
        first = v.send("pre_#{therapy}").try(:name) || t('views.graph.null')
        second = v.send(therapy).try(:name) || t('views.graph.null')
        counter["pre_#{therapy}".to_sym][first] ||= 0
        counter["pre_#{therapy}".to_sym][second] ||= 0
        counter[therapy][first] ||= 0
        counter[therapy][second] ||= 0

        counter["pre_#{therapy}".to_sym][first] += 1
        counter[therapy][second] += 1
    end

    graphs = {}
    first = raw["pre_#{therapy}".to_sym].to_a.sort_by {|r| r.first}
    second = raw[therapy].to_a.sort_by {|r| r.first}
    y_axis_max = [first.max_by{|p| p.second}.second, second.max_by{|p| p.second}.second].max
    graphs['title'] = t(therapy, scope: 'activerecord.models')
    graphs['first'] = {
        colors: %w( #7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 #2b908f #f45b5b #91e8e1 ),
        title: t('views.graph.first'),
        categories: first.map{|r| r.first},
        y_axis_max: y_axis_max,
        series: [
            {name: t('views.graph.first'),
             data: first.map{|r| r.second}},
        ]}

    graphs['second'] = {
        title: t('views.graph.second'),
        colors: %w( #43AC6A #f45b5b #91e8e1 #7cb5ec #434348 #90ed7d #f7a35c #8085e9 #f15c80 #e4d354 ),
        categories: second.map{|r| r.first},
        y_axis_max: y_axis_max,
        series: [
            {name: t('views.graph.second'),
             data: second.map{|r| r.second}},
        ]}
    graphs
  end
end
