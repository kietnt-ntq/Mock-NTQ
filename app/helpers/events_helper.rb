module EventsHelper
   def user_is_captain_event?
    if user_signed_in?
      !Role.where(user_id: current_user.id, group_id: @group.id, roles: 1).blank?
    end
  end
end
