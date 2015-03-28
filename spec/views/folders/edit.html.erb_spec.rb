require 'rails_helper'

RSpec.describe "folders/edit", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :hash => "MyString",
      :name => "MyString",
      :filesize_limit => 1,
      :capacity => 1,
      :duration => ""
    ))
  end

  it "renders the edit folder form" do
    render

    assert_select "form[action=?][method=?]", folder_path(@folder), "post" do

      assert_select "input#folder_hash[name=?]", "folder[hash]"

      assert_select "input#folder_name[name=?]", "folder[name]"

      assert_select "input#folder_filesize_limit[name=?]", "folder[filesize_limit]"

      assert_select "input#folder_capacity[name=?]", "folder[capacity]"

      assert_select "input#folder_duration[name=?]", "folder[duration]"
    end
  end
end
