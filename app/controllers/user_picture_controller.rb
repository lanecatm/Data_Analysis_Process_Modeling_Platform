class UserPictureController < ApplicationController
    RAILS_ROOT = Rails.root
    def update
        # TODO 把头像照片保存为小图
        @user = current_user
        uploaded_io = params[:upload][:file]
        filename, filepath = upload_file(@user.id, uploaded_io)
        if @user.user_picture != nil
            UserPicture.delete(@user.user_picture.id)
        end
        @user_picture = UserPicture.create(:name => filename, :path => filepath, :user_id => @user.id)
        redirect_to edit_user_registration_path
    end

    private
    def upload_file(user_id, file) 
        if !file.original_filename.empty? 
            @filename = user_id.to_s + "." + file.original_filename +  "." + rand(999999).to_s

            FileUtils.mkdir("#{Rails.root}/public/user_picture") unless File.exist?("#{Rails.root}/public/user_picture")
            #向dir目录写入文件 
            @filepath = "#{RAILS_ROOT}/public/user_picture/#{@filename}" 
            File.open(@filepath, "wb") do |f| 
                f.write(file.read) 
            end 
            #返回文件名称，保存到数据库中 
            return [@filename, @filepath]
        end 
    end 

end
