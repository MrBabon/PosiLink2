class Event < ApplicationRecord
  belongs_to :organization
  has_many :articles, dependent: :destroy
  has_many :participations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
