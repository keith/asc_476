require 'spec_helper'

describe 'emails/show' do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      description: 'Desc',
      body: 'MyText',
      subject: 'Subject',
      reply_to: 'Reply To',
      identifier: 'Identifier'
    ))
  end

  it 'renders attributes in <p>' do
    render

    rendered.should match(/Desc/)
    rendered.should match(/MyText/)
    rendered.should match(/Subject/)
    rendered.should match(/Reply To/)
  end
end
