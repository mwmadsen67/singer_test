class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # define columns here
      # t.datatype

      t.string :username, null: false, unique: true
      # ^unique in THIS table..but unique: true shouldn't go here (so it's just ignored)
      t.timestamps #helper that creates `created_at` and `updated_at`
    end

    add_index :users, :username 
    # ^ unique: true actually shouldn't have been added here
    # NEVER FIX OR CHANGE YOUR MIGRATION FILE AFTER MIGRATED!!!!!!!
    # This file is DONE. Never touch it again
    # You have to create a new migration file to edit
  end
end
