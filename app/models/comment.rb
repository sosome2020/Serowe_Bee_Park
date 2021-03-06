class Comment < ApplicationRecord
validates :message, presence: true
belongs_to :user, optional:true
belongs_to :task
end
