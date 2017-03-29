class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
    has_many :articles
    has_many :comments
    before_save { self.email= email.downcase }
    
    validates :username, presence: true, length: {minimum: 3, maximum: 40 }
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                            uniqueness: { case_sensitive: false},
                            format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end