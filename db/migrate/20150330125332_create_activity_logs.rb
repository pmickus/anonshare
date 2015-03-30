class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.integer :folder_id
      t.string :model_type
      t.integer :model_id
      t.string :action
    end

    add_index :activity_logs, :folder_id
  end
end
