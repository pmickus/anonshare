require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :name => "Name",
        :body => "MyText",
        :content => ""
      ),
      Comment.create!(
        :name => "Name",
        :body => "MyText",
        :content => ""
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
