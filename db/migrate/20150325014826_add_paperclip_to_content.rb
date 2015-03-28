class AddPaperclipToContent < ActiveRecord::Migration
  def self.up
    add_attachment :contents, :file
  end

  def self.down
    remove_attachment :contents, :file
  end
end
