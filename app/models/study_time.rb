class StudyTime < ApplicationRecord
  belongs_to :user

  def daily_times
    # hour = self.where(user_id: @user_id).group("year").group("month").group("date").all.sum(:hour))*60
    # min = self.where(user_id: @user_id).group("year").group("month").group("date").all.sum(:min)
    # return ((hour + min) / 60.0).floor(1)
    #そのユーザの日毎のグルーピング
    hour = self.where(user_id: @user_id).group("created_at").all.sum(:hour)*60
    min = self.where(user_id: @user_id).group("created_at").all.sum(:min)
    return ((hour + min) / 60.0).floor(1)
  end

end
