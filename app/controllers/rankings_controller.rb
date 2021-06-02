class RankingsController < ApplicationController
  def ranking
    d = Date.today
    weekly_ranks = StudyTime.where("study_date": d.all_week).group("user_id").all.sum(:min)
    @weekly_results = weekly_ranks.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    monthly_ranks = StudyTime.where("study_date": d.all_month).group("user_id").all.sum(:min)
    @monthly_results = weekly_ranks.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
  end
end
