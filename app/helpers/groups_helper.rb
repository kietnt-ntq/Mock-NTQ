module GroupsHelper

  def user_joined_in_group?
    if user_signed_in?
      !Role.where(user_id: current_user.id, group_id: @group.id, status: 1).blank?
    end
  end

  def user_pending_in_group?
    if user_signed_in?
      !Role.where(user_id: current_user.id, group_id: @group.id, status: 2).blank?
    end
  end

  def user_is_captain?
    if user_signed_in?
      !Role.where(user_id: current_user.id, group_id: @group.id, roles: 1).blank?
    end
  end

end
