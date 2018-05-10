class Event < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :requests

  def as_json
    {
      id: id,
      name: name,
      address: address,
      available_datetime: available_datetime,
      description: description,
      image_url: sport.image_url
    }
  end
end
