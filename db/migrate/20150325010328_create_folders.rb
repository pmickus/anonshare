class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :token
      t.string :name
      t.integer :filesize_limit
      t.integer :capacity
      t.integer :duration
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
