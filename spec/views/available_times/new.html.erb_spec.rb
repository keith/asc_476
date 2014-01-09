require 'spec_helper'

describe "available_times/new" do
  before(:each) do
    assign(:available_time, stub_model(AvailableTime,
      :day => 1
    ).as_new_record)
  end

  it "renders new available_time form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", available_times_path, "post" do
      assert_select "input#available_time_day[name=?]", "available_time[day]"
    end
  end
end
