class User < ApplicationRecord
  validates :user_name, presence: true

  has_many :events, dependent: :destroy
  has_many :event_attendings, foreign_key: :attendee_id
  has_many :events_attended, through: :event_attendings#, source: :attendee
  #has_many :authors, through: :post_authorings, source: :post_author


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
