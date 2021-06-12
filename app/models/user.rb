class User < ApplicationRecord
    has_secure_password #passwordハッシュ化

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_many :tasks
end
