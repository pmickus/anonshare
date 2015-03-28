require 'rails_helper'

RSpec.describe "contents/new", type: :view do
  before(:each) do
    assign(:content, Content.new(
      :type => "",
      :uploaded_by => "MyString"
    ))
  end

  it "renders new content form" do
    render

    assert_select "form[action=?][method=?]", contents_path, "post" do

      assert_select "input#content_type[name=?]", "content[type]"

      assert_select "input#content_uploaded_by[name=?]", "content[uploaded_by]"
    end
  end
end
