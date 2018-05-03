class Event < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :requests
end