class Event < ApplicationRecord
    validates :location, :event, :event_date, :event_time, :user_id, presence: true
    
    belongs_to :creator, class_name: "User", foreign_key: 'user_id'
    has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attenders, through: :event_attendings, source: :attendee
    has_many :invitations, foreign_key: :event_invite, dependent: :destroy

    
    scope :past, -> { where("event_date < ?", Date.today) }
    scope :upcoming, -> { where("event_date >= ?", Date.today) }
end
