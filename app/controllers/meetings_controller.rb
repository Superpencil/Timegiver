class MeetingsController < ApplicationController
  before_action :authenticate_user!


  # GET /teams
  def index
    @meetings = Meeting.order(:datetime)
  end

  # GET /admin/1
  def show
  end

  # GET /admin/new
  def new
    @meeting = Meeting.new
  end

  # GET /admin/1/edit
  def edit
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      redirect_to meeting_path(@meeting), notice: 'Meeting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/1
  def update
    if @meeting.update(meeting_params)
      redirect_to meeting_path(@meeting), notice: 'Meeting was successfully edited.'
    else
      render :edit
    end
  end

  # DELETE /admin/1
  def destroy
    @meeting.destroy
    redirect_to meetings_path, notice: 'Meeting was successfully cancelled.'
  end

  private
    def get_meeting
      @meeting = Meeting.friendly.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:title, :description, :name, :datetime, :team_id)
    end
end