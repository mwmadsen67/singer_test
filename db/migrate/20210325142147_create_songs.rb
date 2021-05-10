class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :body, null: false
      t.integer :author_id, null: false

      t.timestamps #Always add this!

    end

    add_index :songs, :author_id
    #method_name :table_name, :column_name
  end
end
