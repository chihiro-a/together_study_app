class AddCommentToStudyTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :study_times, :comment, :string
  end
end
