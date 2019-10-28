class PendingsController < ApplicationController
  layout "layout_group"
  before_action :group

  def index
    @group = Group.find_by(id: params[:group_id])
    @contents = Content.where(group_id: @group.id,status: 2).order("endDate DESC")
    @members = Role.where(roles: 3, status: 2, group_id:  @group.id)
  end

  def approveContent
    @content = Content.where(id: params[:id], group_id: params[:group_id]).first  
    @content.update_attributes(status: 1)
    flash[:success] = "Approve content successfully"
    redirect_to group_pendings_path(@group)
  end

  def declineContent
    @content = Content.where(id: params[:id], group_id: params[:group_id]).first  
    @content.destroy
    flash[:danger] = "Decline content successfully"
    redirect_to group_pendings_path(@group)
  end

  def approveMember
    @member = Role.where(id: params[:id], group_id: params[:group_id]).first  
    @member.update_attributes(status: 1)
    flash[:success] = "Approve member successfully"
    redirect_to group_pendings_path(@group)
  end

  def declineMember
    @member = Role.where(id: params[:id], group_id: params[:group_id]).first  
    @member.update_attributes(status: 3)
    flash[:danger] = "Decline member successfully"
    redirect_to group_pendings_path(@group)
  end

  private 
  def group
    @group = Group.find_by(params[:group_id])
  end

end
