class JoinGroupsController < ApplicationController

  def joinGroup
    @member =  Role.where(user_id: params[:user_id], group_id: params[:group_id ]).first
    @member_in_group =  Role.where(user_id: params[:user_id], group_id: params[:group_id ], status: 3).first
    @group  = Group.find_by(id: params[:group_id])
    if @member.blank? && @member_in_group.blank?
      @member = Role.new
      @member.user_id = params[:user_id]
      @member.group_id = params[:group_id]
      @member.roles = 3
      @member.status = 2
      @member.save
      flash[:success] = "Add member to pending" 
      redirect_to group_path(@group) 
    elsif !@member_in_group.blank?
      @member_in_group.update_attributes(status: 2)
      flash[:success] = "Add member to pending" 
      redirect_to group_path(@group) 
    end
  end

  def leaveGroup
    @member = Role.where(user_id: params[:user_id], group_id: params[:group_id ]).first
    @group  = Group.find_by(id: params[:group_id])
    @member.update_attributes(status: 3)
    redirect_to group_path(@group)
  end
end
