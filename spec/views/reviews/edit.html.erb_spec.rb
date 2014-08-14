require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :username => "MyString",
      :body => "MyText",
      :post => nil
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_username[name=?]", "review[username]"
      assert_select "textarea#review_body[name=?]", "review[body]"
      assert_select "input#review_post[name=?]", "review[post]"
    end
  end
end
