class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include UsersHelper
  include GroupsHelper

  before_action :course
  before_action :follow_group

  def course
    @course = Course.all.page(params[:page])
    @cour   = Course.all.order("created_at DESC")
  end

  def follow_group
    @following = current_user.groups.order("name ASC") if user_signed_in?
  end

end
