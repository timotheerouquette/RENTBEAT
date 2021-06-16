class Studio < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_one_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
