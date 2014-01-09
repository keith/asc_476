require 'spec_helper'

describe "positions/new" do
  before(:each) do
    assign(:position, stub_model(Position,
      :professor_comments => "MyText",
      :professor_verdict => false,
      :professor_taught => false,
      :application_status => 1,
      :asc_comments => "MyText"
    ).as_new_record)
  end

  it "renders new position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", positions_path, "post" do
      assert_select "textarea#position_professor_comments[name=?]", "position[professor_comments]"
      assert_select "input#position_professor_verdict[name=?]", "position[professor_verdict]"
      assert_select "input#position_professor_taught[name=?]", "position[professor_taught]"
      assert_select "input#position_application_status[name=?]", "position[application_status]"
      assert_select "textarea#position_asc_comments[name=?]", "position[asc_comments]"
    end
  end
end
