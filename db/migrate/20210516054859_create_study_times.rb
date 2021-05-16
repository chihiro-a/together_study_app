class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.integer :year
      t.integer :month
      t.integer :date
      t.integer :hour
      t.integer :min
      t.timestamps
    end
  end
end
