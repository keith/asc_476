require 'spec_helper'

describe "professors/index" do
  before(:each) do
    assign(:professors, [
      stub_model(Professor,
        :name => "Name",
        :email => "Email",
        :identifier => "abc"
      ),
      stub_model(Professor,
        :name => "Name",
        :email => "Email",
        :identifier => "abc"
      )
    ])
  end

  it "renders a list of professors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
