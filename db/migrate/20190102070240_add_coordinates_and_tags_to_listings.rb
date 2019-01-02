class AddCoordinatesAndTagsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :coordinates, :text
    add_column :listings, :tags, :text
  end
end
