class DataPreProcessingController < ApplicationController
    respond_to :html, :js

    RAILS_ROOT = Rails.root

    def new
    end

    def index
        @upload_file = nil
        @upload_files = ProcessFile.all
        if params.has_key?"file"
            @upload_file = ProcessFile.find(params[:file])
            file_path = @upload_file.filepath
            if File.exist?(file_path)
                io = File.open(file_path)
                io.close
            end
        end
    end

    # 上传文件
    def create
        uploaded_io = params[:upload][:file]
        filename, filepath = upload_file(uploaded_io)
        @upload_file = ProcessFile.create(:name => filename, :path => filepath)
        respond_to do |format|
            format.html { redirect_to data_pre_processing_index_path, notice: 'Upload file successfully!' }
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
