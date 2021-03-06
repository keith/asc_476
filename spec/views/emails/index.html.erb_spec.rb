require 'spec_helper'

describe 'emails/index' do
  before(:each) do
    assign(:emails, [
      stub_model(Email,
        body: 'MyText',
        subject: 'Subject',
        reply_to: 'Reply To',
        identifier: 'Identifier'
      ),
      stub_model(Email,
        body: 'MyText',
        subject: 'Subject',
        reply_to: 'Reply To',
        identifier: 'Identifier'
      )
    ])
  end

  it 'renders a list of emails' do
    render

    assert_select 'tr>td', text: 'MyText'.to_s, count: 0
    assert_select 'tr>td', text: 'Subject'.to_s, count: 2
    assert_select 'tr>td', text: 'Reply To'.to_s, count: 2
    assert_select 'tr>td', text: 'Identifier'.to_s, count: 0
  end
end
