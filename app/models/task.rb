class Task < ApplicationRecord
  belongs_to :user
  has_many :task_users,:dependent => :destroy
  default_scope ->{order(created_at: :desc)}
  validates :content,presence: true
end
