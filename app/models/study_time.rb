class StudyTime < ApplicationRecord
  belongs_to :user
  # def today_time
  #   d = Date.today
  #   today_times = StudyTime.where(year: d.year,month: d.month, date: d.mday)
  #   @today_hour = today_times.all.sum(:hour)
  #   @today_min = today_times.all.sum(:min)
  # end
  # 使えない…↑
end
