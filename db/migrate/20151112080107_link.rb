class Link < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :slug, null: false
      t.string :find_desc
      t.string :loc
      
      t.timestamps null: false
    end
    
    add_index :links, [:find_desc, :loc], unique: true
  end
end
