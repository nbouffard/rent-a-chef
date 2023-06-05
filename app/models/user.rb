class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos

  validates :first_name, :last_name, :date_of_birth, :address, presence: true

  has_many :reviews
  has_many :bookmarks
  has_many :messages
end
