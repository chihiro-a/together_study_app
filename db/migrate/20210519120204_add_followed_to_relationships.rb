class AddFollowedToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_reference :relationships, :followed, foreign_key:{ to_table: :users }
  end
end
