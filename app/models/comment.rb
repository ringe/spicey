class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user, foreign_key: :created_by
end
