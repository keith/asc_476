require 'spec_helper'

describe 'applicants/show' do
  before(:each) do
    view.stub(:logged_in_moderator?).and_return(true)
    view.stub(:logged_in_admin?).and_return(true)
    @applicant = assign(:applicant, stub_model(Applicant,
      name: 'Name',
      email: 'Email',
      wuid: 'Wuid',
      phone_number: 'Phone Number',
      class_standing: 0,
      gpa: 1.5,
      gpa_timestamp: Date.today,
      comment: 'MyText',
      major: 'Major',
      minor: 'Minor',
      work_study: false,
      identifier: 'abc'
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Wuid/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Freshman/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(/Major/)
    rendered.should match(/Minor/)
    rendered.should match(/No/)
  end
end
