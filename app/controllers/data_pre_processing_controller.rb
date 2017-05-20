class DataPreProcessingController < ApplicationController
    respond_to :html, :js

    RAILS_ROOT = Rails.root

    def new
    end

    def index
        @upload_file = nil
        #@upload_files = ProcessFile.all
        @file_content_array = Array.new
        if params.has_key?"file"
            @upload_file = ProcessFile.find(params[:file])
            file_path = @upload_file.path
            if File.exist?(file_path)
                io = File.open(file_path)
                if params.has_key?"seperator"
                    seperator_expr_array = params[:seperator]
                    @seperator_expr_str = ""
                    index = 0
                    seperator_expr_array.each do |seperator_expr_sub_str|
                        if (index > 0)
                            @seperator_expr_str = @seperator_expr_str + "|"
                        end
                        @seperator_expr_str = @seperator_expr_str + seperator_expr_sub_str
                        index = index + 1
                    end
                    seperator_expr = Regexp.new @seperator_expr_str
                    @column_number = 0
                    io.each_line {|line|
                        line_content_array = line.split(seperator_expr)
                        if line_content_array.size > @column_number
                            @column_number = line_content_array.size
                        end
                        @file_content_array << line_content_array
                    }
                else
                    io.each_line {|line|
                        line_content_array = Array.new
                        line_content_array << line
                        @file_content_array << line_content_array
                    }
                    @column_number = 1

                end
                io.close
            end
        end
    end

    def seperate
        respond_to do |format|
            format.html { redirect_to data_pre_processing_index_path(:file=>params[:seperator][:upload_file_id], :seperator=>params[:seperators], :useless_column => [0], :useless_row => [0]), notice: 'Upload file successfully!' }
        end
    end

    def choose
        respond_to do |format|
            format.html { redirect_to data_pre_processing_index_path(:file=>params[:choose][:upload_file_id], :seperator=>params[:choose][:seperator].split(" "), :useless_column=>params[:choose][:useless_column].split(","), :useless_row=>params[:choose][:useless_row].split(",")), notice: 'Upload file successfully!' }
        end
 
    end
    # 上传文件
    def create
        uploaded_io = params[:upload][:file]
        filename, filepath = upload_file(uploaded_io)
        @upload_file = ProcessFile.create(:name => filename, :path => filepath)
        respond_to do |format|
            format.html { redirect_to data_pre_processing_index_path(:file=>@upload_file.id, :seperator=> [], :useless_column => [0], :useless_row => [0]), notice: 'Upload file successfully!' }
            format.js   {}
        end
    end

    private

    def upload_file(file) 
        if !file.original_filename.empty? 
            @filename = file.original_filename
            FileUtils.mkdir("#{Rails.root}/public/upload") unless File.exist?("#{Rails.root}/public/upload")
            #向dir目录写入文件 
            @filepath = "#{RAILS_ROOT}/public/upload/#{@filename}"

            File.open(@filepath, "wb") do |f| 
                f.write(file.read) 
            end 
            #返回文件名称，保存到数据库中 
            return [@filename, @filepath]
        end 
    end 

end
