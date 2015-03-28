require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :type => "Type",
        :uploaded_by => "Uploaded By"
      ),
      Content.create!(
        :type => "Type",
        :uploaded_by => "Uploaded By"
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Uploaded By".to_s, :count => 2
  end
end
