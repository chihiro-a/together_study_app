class RemoveHourFromStudyTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_times, :hour, :integer
  end
end
