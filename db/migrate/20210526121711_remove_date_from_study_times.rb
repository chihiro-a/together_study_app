class RemoveDateFromStudyTimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_times, :date, :integer
  end
end
