class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :content_id

      t.timestamps null: false
    end

    add_index :comments, :content_id
  end
end
