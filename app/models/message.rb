class Message < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :chef, class_name: "User"

  validates :title, :content, presence: true

  enum status: { unread: 0, read: 1 }
end
