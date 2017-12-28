class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 140}
  validates :deadline , presence: true
  validates :user_id, presence: true
  enum status: {未着手:1, 着手中:2, 完了:3}
  enum priority: {大:100, 中:10, 小:1}

  belongs_to :user
  #def user
  #  return User.find_by(id: self.user_id)
  #end
end
