class RemoveMonthFromStudyTimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_times, :month, :integer
  end
end
