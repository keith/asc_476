require 'spec_helper'

describe "available_times/show" do
  before(:each) do
    @available_time = assign(:available_time, stub_model(AvailableTime,
      :day => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
