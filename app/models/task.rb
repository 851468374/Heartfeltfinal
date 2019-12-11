class Task < ApplicationRecord
  has_many :task_and_users,dependent: :destroy
  belongs_to :user
  default_scope ->{order(created_at: :desc)}
  validates :user_id,presence: true
  validates :content,presence: true
end
