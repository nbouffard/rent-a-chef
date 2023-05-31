class Review < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :chef, class_name: "User"

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
end
