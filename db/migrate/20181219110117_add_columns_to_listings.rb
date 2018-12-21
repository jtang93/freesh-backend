class AddColumnsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :user_id, :integer
    add_column :listings, :item, :text
    add_column :listings, :condition, :text
    add_column :listings, :location, :text
    add_column :listings, :picture, :text
  end
end
