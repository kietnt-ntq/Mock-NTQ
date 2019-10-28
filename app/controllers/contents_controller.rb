class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_group
  before_action :authenticate_user!
  before_action :logged_in_user

  layout "layout_group", only: [:new]

  def new
    @content = Content.new
  end

  def edit
    respond_to do |format|
    format.html
    format.js
    end
  end

  def create
    @role = Role.where(user_id: current_user.id,group_id: @group.id, roles: 1)  if !current_user.nil?
    if @role.blank?
      @content = current_user.contents.create(content_params)
      @content.group_id = @group.id
      @content.status = 2
      if @content.save
        flash[:success] = "Content is pendiing"
        redirect_to @group
      else
        render 'new'
      end
    else
      @content = current_user.contents.create(content_params)
      @content.group_id = @group.id
      @content.status = 1
      if @content.save
        flash[:success] = "Content was successfully created"
        redirect_to @group
      else
        render 'new'
      end
    end
  end

  def update
    if @content.update(content_params)
     respond_to do |format|
      flash[:success] = "Content was updated"
      format.js {}
     end
    else
     flash.now[:danger] = "Content was not updated"
     render 'edit'
    end
  end

  def destroy
  @content.destroy
  flash[:success] = "Contetn was deleted"
  redirect_to @group
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def content_params
       params.require(:content).permit(:title, :description, :level, :startDate, :endDate)
    end

    def logged_in_user
      unless user_signed_in?
          flash[:danger] = "Please Log In"
          redirect_to root_path
      end
    end

end
