class DataPreProcessingController < ApplicationController

    RAILS_ROOT = Rails.root

    def new
    end

    def show
    end

    def upload
        uploaded_io = params[:upload][:file]
        filename, filepath = upload_file(uploaded_io)
        #@upload_file = UploadFile.create(:name => filename, :path => filepath)
        #if @process_information.upload_file != nil
        #    UploadFile.delete(@process_information.upload_file.id)
        #end
        #@process_information.upload_file = @upload_file
        #@process_information.save

        redirect_to preprocess_data_path

    end
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
