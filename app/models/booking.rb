class Booking < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :chef, class_name: "User"

  validates :status, presence: true
  validates :date, presence: true
end
