require 'spec_helper'

describe "reviewers/new.html.erb" do
  before(:each) do
    assign(:reviewer, stub_model(Reviewer,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new reviewer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviewers_path, :method => "post" do
      assert_select "input#reviewer_email", :name => "reviewer[email]"
    end
  end
end
