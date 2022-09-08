class Invitation < ApplicationRecord
    validates :inviter_id, :invitee, :event_invite_id, presence: true

    belongs_to :inviter, class_name: "User"
    belongs_to :event_invite, class_name: "Event"
    belongs_to :invitee, class_name: "User"
end