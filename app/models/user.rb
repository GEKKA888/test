class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :tasks, dependent: :destroy
  has_many :labels, dependent: :destroy

  enum user_type: { admin: 1, normal: 2 }
end
