class StudyTimesController < ApplicationController
  def new
    @study_time = StudyTime.new
  end

  def create
    @study_time = StudyTime.new
    @study_time.user_id = current_user.id
    @study_time.study_date = Date.today
    @study_time.comment = params[:study_time][:comment]
    hour = (params[:study_time][:hour].to_i)*60
    min = params[:study_time][:min]
    @study_time.min = hour.to_i + min.to_i
    @study_time.save
    redirect_to study_time_path(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @all_study_times = @user.study_times
    @daily_times = StudyTime.where(user_id: @user.id).group("study_date").all.sum(:min)
  end

  def daily_show
    date = params[:format].to_s
    @daily_study_details = StudyTime.where(study_date: date)
  end

  def edit
    @study_time = StudyTime.find(params[:id])
  end

  def update
    @study_time = StudyTime.find(params[:id])
    # @study_time.update(hour: params[:hour]*60 ,min: params[:min])
    @study_time.min = params[:study_time][:min].to_i + (params[:study_time][:hour].to_i)*60
    @study_time.comment = params[:study_time][:comment]
    @study_time.save
    redirect_to study_time_path(current_user.id)
  end

  def destroy
    @study_time = StudyTime.find(params[:id])
    @study_time.destroy
    redirect_to study_time_path(current_user.id)
  end

  private
  def study_time_params
    params.require(:study_time).permit(:year,:date,:hour,:min,:comment)
  end

end
