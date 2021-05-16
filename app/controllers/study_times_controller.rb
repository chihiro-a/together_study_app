class StudyTimesController < ApplicationController
  def new
    @study_time = StudyTime.new
  end

  def create
    @study_time = StudyTime.new(study_time_params)
    @study_time.user_id = current_user.id
    d = Date.today
    @study_time.year = d.year
    @study_time.month = d.month
    @study_time.date = d.mday
    @study_time.save
    redirect_to study_times_path
  end

  def index
    @study_times = current_user.study_times
    d = Date.today
    today_times = StudyTime.where(year: d.year,month: d.month, date: d.mday)
    today_hour = today_times.all.sum(:hour) * 60
    today_min = today_times.all.sum(:min)
    @total_time = ((today_hour + today_min) / 60.0).floor(1)

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
