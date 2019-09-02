class CreateRelationOis < ActiveRecord::Migration[5.2]
  def change
    create_table :relation_ois do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
