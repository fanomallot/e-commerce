class CreateRelationois < ActiveRecord::Migration[5.2]
  def change
    create_table :relationois do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
