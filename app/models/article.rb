class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true, length: {minimum: 1, maximum: 30}
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: {minimum: 10, maximum: 50 }
  
end