class UsersController < ApplicationController
    def index
        @group = Group.where(course_id: params[:course_id]) 
    end
    def show
        @user = User.find(params[:id])
        @groups = Role.where(user_id: @user.id)
    end

    def edit
        @user = User.new
    end

    def update
        @user = User.find(params[:id])
        @user.update_attributes(user_params)
        flash[:success] = "Update User successfully"
        redirect_to user_path(current_user)
    end

    private

    def user_params
        params.require(:user).permit :fullname, :description, :skype, :dateofbirth
    end
end
