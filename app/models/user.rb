class User < ApplicationRecord
  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  has_many :events, dependent: :destroy
  has_many :event_attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :events_attended, through: :event_attendings
  has_many :sent_invites, foreign_key: :inviter_id, class_name: "Invitation"
  has_many :received_invites, foreign_key: :invitee_id, class_name: "Invitation"
  #has_many :authors, through: :post_authorings, source: :post_author


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
