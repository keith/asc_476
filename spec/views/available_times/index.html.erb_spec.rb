require 'spec_helper'

describe "available_times/index" do
  before(:each) do
    assign(:available_times, [
      stub_model(AvailableTime,
        :day => 1
      ),
      stub_model(AvailableTime,
        :day => 1
      )
    ])
  end

  it "renders a list of available_times" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
