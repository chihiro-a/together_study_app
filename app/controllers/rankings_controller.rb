class RankingsController < ApplicationController
  def ranking
    d = Date.today
    weekly_times = StudyTime.where("study_date": d.all_week).group("user_id").all.sum(:min)
    @weekly_ranks = weekly_times.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    monthly_times = StudyTime.where("study_date": d.all_month).group("user_id").all.sum(:min)
    @monthly_ranks = monthly_times.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
  end
end
