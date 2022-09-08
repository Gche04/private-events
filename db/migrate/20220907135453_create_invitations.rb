class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|

      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :event_invite_id

      t.timestamps
    end
  end
end
