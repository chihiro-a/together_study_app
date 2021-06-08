class RemoveYearFromStudyTimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_times, :year, :integer
  end
end
