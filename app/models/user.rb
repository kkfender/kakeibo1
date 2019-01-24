class User < ApplicationRecord
  has_secure_password
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
   validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
   validates :name,presence: true, length: { maximum: 8 }
  
 
end
