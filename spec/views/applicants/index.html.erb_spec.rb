require 'spec_helper'

describe 'applicants/index' do
  before(:each) do
    assign(:applicants, [
      stub_model(Applicant,
        name: 'Name',
        email: 'Email',
        wuid: 'Wuid',
        phone_number: 'Phone Number',
        class_standing: 'Class Standing',
        gpa: 1.5,
        gpa_timestamp: Date.today,
        comment: 'MyText',
        major: 'Major',
        minor: 'Minor',
        work_study: false,
        identifier: 'abc'
      ),
      stub_model(Applicant,
        name: 'Name',
        email: 'Email',
        wuid: 'Wuid',
        phone_number: 'Phone Number',
        class_standing: 'Class Standing',
        gpa: 1.5,
        gpa_timestamp: Date.today,
        comment: 'MyText',
        major: 'Major',
        minor: 'Minor',
        work_study: false,
        identifier: 'def'
      )
    ])
  end

  it 'renders a list of applicants' do
    render
    assert_select 'tr>td', text: 'Name', count: 2
    assert_select 'tr>td', text: "Email#{ EMAIL_SUFFIX }", count: 2
    assert_select 'tr>td', text: 'Wuid', count: 2
    assert_select 'tr>td', text: 'Phone Number', count: 2
    assert_select 'tr>td', text: 'Class Standing', count: 2
    assert_select 'tr>td', text: 1.5.to_s, count: 2
    assert_select 'tr>td', text: 'MyText', count: 2
    assert_select 'tr>td', text: 'Major', count: 2
    assert_select 'tr>td', text: 'Minor', count: 2
    assert_select 'tr>td', text: 'No', count: 2
  end
end
