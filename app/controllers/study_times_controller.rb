class StudyTimesController < ApplicationController
  def new
    @study_time = StudyTime.new
  end

  def create
    @study_time = StudyTime.new
    @study_time.user_id = current_user.id
    d = Date.today
    @study_time.year = d.year
    @study_time.month = d.month
    @study_time.date = d.mday
    @study_time.comment = params[:study_time][:comment]
    # 追加↓
    if params[:study_time][:hour] == nil
      hour = 0
    else
      hour = (params[:study_time][:hour].to_i)*60
    end
    if params[:study_time][:min] == nil
      min = 0
    else
      min = params[:study_time][:min]
    end
    @study_time.min = hour.to_i + min.to_i
    @study_time.save
    redirect_to study_time_path(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @study_times = @user.study_times
    # ↓今日の勉強時間合計を出すための記述
    d = Date.today
    today_times = @study_times.where(year: d.year,month: d.month, date: d.mday)
    # today_hour = today_times.all.sum(:hour) * 60
    # today_hour = today_times.all.sum(:hour)
    @today_min = (today_times.all.sum(:min)/ 60.0).floor(1)
    # @total_time = ((today_hour + today_min) / 60.0).floor(1)
    # @hour = StudyTime.where(user_id: @user_id).group("user_id").group("year").group("month").group("date").all.sum(:hour)
    # @hour = StudyTime.where(user_id: @user.id).group("created_at").all.sum(:hour)
    # @min = StudyTime.where(user_id: @user.id).group("created_at").all.sum(:min)
    # a = @hour + @min



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
