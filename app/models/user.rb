class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include PgSearch::Model

  pg_search_scope :search,
    against: [:first_name, :last_name, :city, :cuisine],
    using: {
      tsearch: { prefix: true }
    }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos
  has_one_attached :profile_photo

  validates :first_name, :last_name, :date_of_birth, :address, :city, presence: true

  has_many :reviews, dependent: :destroy
  has_many :bookings
  has_many :messages

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews_as_chef, class_name: "Review", foreign_key: :chef_id
end
