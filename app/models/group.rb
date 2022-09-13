class Group < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages
  validates :name, presence: true
  validates :purpose, presence: true
  validates :location, presence: true
end
