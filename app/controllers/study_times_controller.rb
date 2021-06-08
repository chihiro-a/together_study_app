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
    if @study_time.save
      redirect_to study_time_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @all_study_times = @user.study_times
    @daily_times = StudyTime.where(user_id: @user.id).group("study_date").order("study_date DESC").all.sum(:min)
  end

  def daily_show
    @date = params[:id].to_s
    @daily_study_details = StudyTime.where(user_id:current_user.id, study_date: @date)
  end

  def destroy
    @study_time = StudyTime.find(params[:id])
    @study_time.destroy
    redirect_to daily_show_path(@study_time.study_date)
  end

  private
  def study_time_params
    params.require(:study_time).permit(:year,:date,:hour,:min,:comment)
  end

end
