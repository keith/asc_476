require 'spec_helper'

describe 'positions/edit' do
  before(:each) do
    view.stub(:logged_in?).and_return(true)
    @position = assign(:position, stub_model(Position,
      professor_comments: 'MyText',
      professor_verdict: false,
      professor_taught: false,
      application_status: 1,
      identifier: 'abc',
      applicant: mock_model(Applicant, FactoryGirl.attributes_for(:applicant)),
      professor: mock_model(Professor, FactoryGirl.attributes_for(:professor)),
      course: mock_model(Course, FactoryGirl.attributes_for(:course).merge({ full_name: 'CSCI 123' }))
    ))
  end

  it 'renders the edit position form for the professors' do
    view.stub(:logged_in_admin?).and_return(false)
    render

    assert_select 'form[action=?][method=?]', position_path(@position), 'post' do
      assert_select 'textarea#position_professor_comments[name=?]', 'position[professor_comments]'
      assert_select 'input#position_professor_verdict_true[name=?]', 'position[professor_verdict]'
      assert_select 'input#position_professor_verdict_false[name=?]', 'position[professor_verdict]'
      assert_select 'input#position_professor_taught_true[name=?]', 'position[professor_taught]'
      assert_select 'input#position_professor_taught_false[name=?]', 'position[professor_taught]'
      rendered.should match(/CSCI\s123/)
    end
  end

  it 'renders the edit position form for the ASC' do
    view.stub(:logged_in_admin?).and_return(true)
    render

    assert_select 'form[action=?][method=?]', position_path(@position), 'post' do
      rendered.should match(/No/)
      rendered.should match(/#{ Status.for_number(1) }/)
    end
  end
end
