class User < ActiveRecord:Base
    has_secure_password
    validates :email, format: { with: /\w+\@\w+\.\w{2,}/, message: "Please enter an actual email format."}
    validates :email, uniqueness: true
    validates :password, length: { in: 8..12 }
end