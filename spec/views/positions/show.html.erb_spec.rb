require 'spec_helper'

describe 'positions/show' do
  before(:each) do
    view.stub(:logged_in_admin?).and_return(true)
    view.stub(:logged_in?).and_return(true)
    @position = assign(:position, stub_model(Position,
      professor_comments: 'MyText',
      professor_verdict: false,
      professor_taught: false,
      application_status: 1,
      identifier: 'abc',
      applicant: mock_model(Applicant,
                            FactoryGirl.attributes_for(:applicant)),
      professor: mock_model(Professor,
                            FactoryGirl.attributes_for(:professor))
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/No/)
    rendered.should match(/#{ Status.for_number(1) }/)
  end
end
