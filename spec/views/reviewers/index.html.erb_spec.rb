require 'spec_helper'

describe "reviewers/index.html.erb" do
  before(:each) do
    assign(:reviewers, [
      stub_model(Reviewer,
        :email => "Email"
      ),
      stub_model(Reviewer,
        :email => "Email"
      )
    ])
  end

  it "renders a list of reviewers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
