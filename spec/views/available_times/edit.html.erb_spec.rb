require 'spec_helper'

describe "available_times/edit" do
  before(:each) do
    @available_time = assign(:available_time, stub_model(AvailableTime,
      :day => 1
    ))
  end

  it "renders the edit available_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", available_time_path(@available_time), "post" do
      assert_select "input#available_time_day[name=?]", "available_time[day]"
    end
  end
end
