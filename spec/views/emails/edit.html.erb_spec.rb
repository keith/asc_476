require 'spec_helper'

describe 'emails/edit' do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      body: 'MyText',
      subject: 'MyString',
      reply_to: 'MyString',
      identifier: 'MyString'
    ))
  end

  it 'renders the edit email form' do
    render

    assert_select 'form[action=?][method=?]', email_path(@email), 'post' do
      assert_select 'textarea#email_body[name=?]', 'email[body]'
      assert_select 'input#email_subject[name=?]', 'email[subject]'
      assert_select 'input#email_reply_to[name=?]', 'email[reply_to]'
    end
  end
end
