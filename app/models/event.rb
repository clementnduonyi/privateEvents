class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    scope :upcoming, -> { where('event_end_date >= ?', Date.today) }
    scope :past, -> { where('event_end_date < ?', Date.today) }
end
