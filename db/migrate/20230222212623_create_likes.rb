class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :resource_type, null: false
      t.integer :resource_id, null: false
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
