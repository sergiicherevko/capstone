class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :events
  has_many :requests
  has_many :user_sports
  has_many :sports, through: :user_sports
end
