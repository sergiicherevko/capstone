class Request < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def as_json
    {
      user_id: user_id,
      event_id: event_id,
      accepted: false,
      message: message
    }
  end
end



# current_user not working
