class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  delegate :date, to: :event

  def self.participation_for(user, event)
    Participation.find_by(user: user, event: event)
  end

  def time
    "#{date.strftime('%I:%M %p')}"
  end

end
