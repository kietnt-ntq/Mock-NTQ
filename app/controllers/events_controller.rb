class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_start_date, only: [:create]
  layout "layout_group"

  def index
        @group = Group.find_by(id: params[:group_id])
        @events = Event.where(group_id: params[:group_id])
        @eventsdone = Event.where(group_id: params[:group_id]).where('endDate <= ?',Time.now).order("endDate DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
    @members_active = Role.where( status:1, group_id: params[:group_id])
    @members_isprove = Role.where(status:3, group_id: params[:group_id])
    @attendances = AttendanceEvent.all
  end

  def create
    if !Role.where(user_id: current_user.id, group_id: params[:event][:group_id], roles: 1).blank?
          @event = Event.new(event_params)
            if !params[:event][:content_id].blank?
              @event.startDate = params[:event][:startDate]
              @event.color = "Red"
            else
              @event.startDate = @full_date
            end
          @event.save
          flash.now[:success] = "Create event successfully"
    else
          flash.now[:danger] = "you don't have the right to create event"
    end
  end

  def update
    @event.startDate = params[:event][:startDate]
    if @event.update(event_params)
      flash[:success] = "Event was updated"
    else
      flash[:danger] = "Event was not updated"
    end
  end


  def destroy
    @event.destroy
  end

  private

  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :something, :document,
                                          :speaker, :color, :duration,
                                          :group_id, :content_id)
  end

  def set_start_date
    @date = params.dig(:event, :startDate2) + " " + params.dig(:event, :startDate)
    @full_date = Time.zone.parse(@date)
  end


end