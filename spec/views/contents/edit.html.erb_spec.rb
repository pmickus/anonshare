require 'rails_helper'

RSpec.describe "contents/edit", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :type => "",
      :uploaded_by => "MyString"
    ))
  end

  it "renders the edit content form" do
    render

    assert_select "form[action=?][method=?]", content_path(@content), "post" do

      assert_select "input#content_type[name=?]", "content[type]"

      assert_select "input#content_uploaded_by[name=?]", "content[uploaded_by]"
    end
  end
end
