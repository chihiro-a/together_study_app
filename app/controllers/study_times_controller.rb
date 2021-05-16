class StudyTimesController < ApplicationController
  def new
    @studeytime = StudyTime.new
  end

  def create
    @studey_time = StudyTime.new
    @studey_time.user_id = current_user.id
    d = Date.today
    @studey_time.year = d.year
    @studey_time.month = d.month
    @studey_time.date = d.mday
    @studey_time.hour = params[:hour]
    @studey_time.min = params[:min]
    @studey_time.comment = params[:comment]
    @studey_time.save
    redirect_to study_times_path
  end

  def index
    @study_times = current_user.study_times
  end

  def edit
    @study_time = StudyTime.find(params[:id])
  end

  def update
    @study_time = StudyTime.find(params[:id])
    @study_time.update(study_time_params)
    redirect_to study_times_path
  end

  private
  def study_time_params
    params.require(:study_time).permit(:year,:date,:hour,:min,:comment)
  end

end
