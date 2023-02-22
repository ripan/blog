class AddMissingIndexesOnLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, %i[resource_id resource_type], unique: true
  end
end
