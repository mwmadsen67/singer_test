class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false #the primary id in users table
      t.integer :song_id, null: false # primary id in songs table

      t.timestamps
    end

    add_index :likes, :liker_id
    add_index :likes, :song_id 
  end
end
