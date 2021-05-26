class AddProfileImageToStudyTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :study_times, :profile_image, :date
  end
end
