class Label < ApplicationRecord
  validates :name , presence: true
  validates :user_id, presence: true
  validates :task_id, presence: true
  belongs_to :user
end
