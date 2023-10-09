class Event < ApplicationRecord
  belongs_to :organization
  has_many :articles, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_one_attached :picture

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
