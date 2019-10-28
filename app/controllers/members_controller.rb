class MembersController < ApplicationController
  layout "layout_group"
  before_action :group
  before_action :role_current_user
  before_action :logged_in_user?, only: :create

  def index
    @members = Role.where(roles: 3, status:1, group_id: params[:group_id])
    @mentor  = Role.where(roles: 2, status:1, group_id: params[:group_id])
    @captain = Role.where(roles: 1, status:1, group_id: params[:group_id])

  end

  def create
      @user = User.find_by(email: params[:member][:email])
      @user_in_group = @user.roles.where(group_id: params[:group_id], status: 1) if !@user.blank?
      @user_in_pending = @user.roles.where(group_id: params[:group_id], status: 2) if !@user.blank?
      @user_in_joined = @user.roles.where(group_id: params[:group_id], status: 3) if !@user.blank?
      if @user
          if @user_in_group.blank? && @user_in_pending.blank? && @user_in_joined.blank?
            if @role_current_user.blank? || @role_current_user.nil?
              @role = Role.new
              @role.group_id = params[:group_id]
              @role.user_id = @user.id
              @role.roles = 3
              @role.status = 2
              @role.save
              flash[:success] = "Add member to pending" 
              redirect_to group_members_path(@group) 
            else
              @role = Role.new
              @role.group_id = params[:group_id]
              @role.user_id = @user.id
              @role.roles = 3
              @role.status = 1
              @role.save
              flash[:success] = "Add member success" 
              redirect_to group_members_path(@group) 
            end
          elsif !@user_in_joined.blank?
            if @role_current_user.blank? || @role_current_user.nil?
              @member = Role.find_by(user_id: @user.id)
              @member.update_attributes(status: 2)
                flash[:success] = "Add member pending" 
                redirect_to group_members_path(@group)
            else
              @member = Role.find_by(user_id: @user.id)
              @member.update_attributes(status: 1)
              flash[:success] = "Add member success" 
              redirect_to group_members_path(@group) 
            end
          else
            flash[:danger] = "Thành viên đã có trong group"
            redirect_to group_members_path(@group)   
          end
      else
        flash[:danger] = "Email not exist in system"
        redirect_to group_members_path(@group) 
      end
  end

  private

  def group
    @group = Group.find_by(id: params[:group_id])
  end

  def role_current_user
    @role_current_user = current_user.groups.where(id: params[:group_id]).includes(:roles).where("roles.roles = ?", "1")  if user_signed_in?
  end

  def logged_in_user?
    unless user_signed_in?
        flash[:danger] = "Please log in before add member "
        redirect_to group_members_path(@group)   
    end
  end

end
