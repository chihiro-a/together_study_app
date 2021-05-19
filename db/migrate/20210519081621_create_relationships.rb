class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      # t.reference :fallowing ,foreign_key:{ to_table: :users }
      # t.reference :followed ,foreign_key:{ to_table: :users }

      t.timestamps
    end
  end
end
