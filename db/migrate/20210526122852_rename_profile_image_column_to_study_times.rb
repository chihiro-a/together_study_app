class RenameProfileImageColumnToStudyTimes < ActiveRecord::Migration[5.2]
  def change
    rename_column :study_times, :profile_image, :study_date
  end
end
