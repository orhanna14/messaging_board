class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  default_scope -> { order(updated_at: :asc )}
end
