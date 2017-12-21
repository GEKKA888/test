class Task < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 50}}
  validates :content, {presence: true, length: {maximum: 140}}
  validates :deadline , presence: true
  enum status: {未着手:1, 着手中:2, 完了:3}
end
