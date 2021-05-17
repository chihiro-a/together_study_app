class CreateRecommendComments < ActiveRecord::Migration[5.2]
  def change
    create_table :recommend_comments do |t|
      t.integer :user_id
      t.integer :recommend_id
      t.text :recommend_comment
      t.timestamps
    end
  end
end
