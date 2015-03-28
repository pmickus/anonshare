class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :file_type
      t.string :uploaded_by
      t.integer :folder_id
      t.timestamps null: false
    end
    
    add_index :contents, :folder_id
  end
end
