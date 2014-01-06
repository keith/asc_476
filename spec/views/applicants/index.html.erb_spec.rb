require 'spec_helper'

describe "applicants/index" do
  before(:each) do
    assign(:applicants, [
      stub_model(Applicant,
        :name => "Name",
        :email => "Email",
        :wuid => "Wuid",
        :phone_number => "Phone Number",
        :class_standing => "Class Standing",
        :gpa => 1.5,
        :comment => "MyText",
        :major => "Major",
        :minor => "Minor",
        :work_study => false
      ),
      stub_model(Applicant,
        :name => "Name",
        :email => "Email",
        :wuid => "Wuid",
        :phone_number => "Phone Number",
        :class_standing => "Class Standing",
        :gpa => 1.5,
        :comment => "MyText",
        :major => "Major",
        :minor => "Minor",
        :work_study => false
      )
    ])
  end

  it "renders a list of applicants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Wuid".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Class Standing".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
    assert_select "tr>td", :text => "Minor".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
