class RankingsController < ApplicationController
  def weekly
    d = Date.today
    weekly_ranks = StudyTime.where("study_date": d.all_week).group("user_id").all.sum(:min)
    @result = weekly_ranks.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    #今週のユーザ毎の勉強時間合計
  end
  
  def monthly
    d = Date.today
    @ranks = StudyTime.where("study_date": d.all_week).group("user_id").all.sum(:min)
    @result = @ranks.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
  end
end
