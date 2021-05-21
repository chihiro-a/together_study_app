class AddFollowingToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_reference :relationships, :following, foreign_key: { to_table: :users }
  end
end
