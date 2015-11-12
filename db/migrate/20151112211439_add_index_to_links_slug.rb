class AddIndexToLinksSlug < ActiveRecord::Migration
  def change
  	add_index :links, :slug, unique: true
  end
end
