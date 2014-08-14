require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :username => "MyString",
      :body => "MyText",
      :post => nil
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_username[name=?]", "review[username]"
      assert_select "textarea#review_body[name=?]", "review[body]"
      assert_select "input#review_post[name=?]", "review[post]"
    end
  end
end
