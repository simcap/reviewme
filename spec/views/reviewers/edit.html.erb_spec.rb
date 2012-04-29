require 'spec_helper'

describe "reviewers/edit.html.erb" do
  before(:each) do
    @reviewer = assign(:reviewer, stub_model(Reviewer,
      :email => "MyString"
    ))
  end

  it "renders the edit reviewer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviewers_path(@reviewer), :method => "post" do
      assert_select "input#reviewer_email", :name => "reviewer[email]"
    end
  end
end
