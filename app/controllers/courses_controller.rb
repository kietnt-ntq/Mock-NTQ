class CoursesController < ApplicationController

  def index

  end

  def update
    @course = Course.find_by(params[:id]) 
    @group = Group.find_by(id: params[:group_id])
    if @course.update_attributes(name: params[:course][:name])
      flash[:success] = "Course updated"
      redirect_to @group
    else
      flash.now[:danger] = "Course don't updated"
      redirect_to group_settings_path(@group)
    end
  end
end
