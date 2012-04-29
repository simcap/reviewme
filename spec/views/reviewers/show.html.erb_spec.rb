require 'spec_helper'

describe "reviewers/show.html.erb" do
  before(:each) do
    @reviewer = assign(:reviewer, stub_model(Reviewer,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
