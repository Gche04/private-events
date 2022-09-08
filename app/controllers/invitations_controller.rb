class InvitationsController < ApplicationController
    before_action :login
      
    def create
        @invitation = Invitation.new

        @invitation.inviter_id = params[:inviter_id]
        name = User.find_by(user_name: params[:invitee])

        @invitation.invitee_id = name.id if name
        @invitation.event_invite_id = params[:event_invite_id]

        if already_invited? || inviting_self?
            @invitation.invitee_id = nil
        end

        if @invitation.save
            redirect_to request.referrer#events_url
        else
            redirect_to request.referrer, status: :unprocessable_entity
        end
    end

    def destroy
        @invitation = Invitation.find(params[:id])
        @invitation.destroy
    
        redirect_to events_url, status: :see_other
      end

    private

    def login
        unless user_signed_in?
          flash[:error] = "signed in to attend event"
          redirect_to new_user_session_url
        end
    end

    def already_invited?
        check = Invitation.where(inviter_id: @invitation.inviter_id, 
                                invitee_id: @invitation.invitee_id,
                                event_invite_id: @invitation.event_invite_id)
        return if check.empty?
        return true
    end

    def inviting_self?
        return true if @invitation.inviter_id == @invitation.invitee_id
    end
end
