class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
    has_one :user_picture, dependent: :destroy 
    def admin?
        #self.role == "admin"
        true
    end
    def name
        self.user_name
    end
    def profile_url

        return "/assets/user.jpg"
    end
end
