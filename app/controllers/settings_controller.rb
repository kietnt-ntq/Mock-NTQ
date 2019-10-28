class SettingsController < ApplicationController
    layout 'layout_group'
    before_action :logged_in_user
    def index
        @group = Group.find_by(id: params[:group_id])
        @course = Course.where(id: @group.course_id, user_id: current_user.id).first
    end

    private 
    def logged_in_user
        unless user_signed_in?
            flash[:danger] = "Please Log In"
            redirect_to root_path
        end
      end

end
