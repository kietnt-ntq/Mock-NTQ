class AttendancesController < ApplicationController
  layout "layout_group"

  def index
    @group = Group.find_by(id: params[:group_id]) 
    @contents = Content.where(group_id: @group.id).order("endDate DESC")
    @events   = Event.where(group_id: @group.id).order("endDate DESC")
  end

  def show
    if params[:slug] == "content"
      @members = Attendance.where(content_id: params[:id])
      @content = Content.find_by(id: params[:id])
    elsif params[:slug] == "event"
      @members = AttendanceEvent.where(event_id: params[:id])
      @content = Event.find_by(id: params[:id])
    end
    
    @group = Group.find_by(id: params[:group_id])
  end

  def eventAtendance
    params[:member].each do |key,_value|
      check = params[:member][:"#{key}"][:check]
      @group = Group.find_by(id: params[:member][:"#{key}"][:group_id])
      value_user = params[:member][:"#{key}"][:user_id]
      value_event = params[:member][:"#{key}"][:event_id]
      value_note = params[:member][:"#{key}"][:note]
      @active = AttendanceEvent.where( user_id: value_user, event_id: value_event)
      if @active.blank?
        if check == "yes"
          @attendance = AttendanceEvent.new
          @attendance.status = 1 
          @attendance.user_id = value_user
          @attendance.event_id = value_event
          @attendance.note = value_note if !value_note.blank?
          @attendance.save
        else
          @attendance = AttendanceEvent.new
          @attendance.status = 2 
          @attendance.user_id = value_user
          @attendance.event_id = value_event
          @attendance.note = value_note
          @attendance.save
        end
      elsif !@active.blank?
        if check == "yes"
          @active.update_all(user_id: value_user, event_id: value_event, note: value_note, status: 1 )
        else
          @active.update_all(user_id: value_user, event_id: value_event, note: value_note, status: 2 )
        end
      end
    end
  flash[:success]  = "Update Attendance successfully"
  redirect_to group_events_path(group_id: @group.id)
  end

  def create
    params[:member].each do |key,_value|
      check = params[:member][:"#{key}"][:check]
      @group = Group.find_by(id: params[:member][:"#{key}"][:group_id])
      value_user = params[:member][:"#{key}"][:user_id]
      value_content = params[:member][:"#{key}"][:content_id]
      value_note = params[:member][:"#{key}"][:note]
      @active = Attendance.where( user_id: value_user, content_id: value_content)
      if @active.blank?
        if check == "yes"
          @attendance = Attendance.new
          @attendance.status = 1 
          @attendance.user_id = value_user
          @attendance.content_id = value_content
          @attendance.note = value_note if !value_note.blank?
          @attendance.save
        else
          @attendance = Attendance.new
          @attendance.status = 2 
          @attendance.user_id = value_user
          @attendance.content_id = value_content
          @attendance.note = value_note
          @attendance.save
        end
      elsif !@active.blank?
        if check == "yes"
          @active.update_all(user_id: value_user, content_id: value_content, note: value_note, status: 1 )
        else
          @active.update_all(user_id: value_user, content_id: value_content, note: value_note, status: 2 )
        end
      end
    end
  flash[:success]  = "Update Attendance successfully"
  redirect_to @group
  end
  
end