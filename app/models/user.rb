class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :own_events, inverse_of: "creator", foreign_key: :creator_id, class_name: "Event"
  has_many :attendances, foreign_key: :attendee_id, inverse_of: "attendee"
  has_many :attended_events, through: :attendances, source: :events
end
