require 'spec_helper'

describe 'users/edit' do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => 'MyString',
      :email => 'MyString',
      :password => 'MyString',
      :password_confirmation => 'MyString',
      :level => 1
    ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input#user_name[name=?]', 'user[name]'
      assert_select 'input#user_email[name=?]', 'user[email]'
      assert_select 'input#user_password[name=?]', 'user[password]'
      assert_select 'input#user_password_confirmation[name=?]', 'user[password_confirmation]'
      assert_select 'input#user_level[name=?]', 'user[level]'
    end
  end
end

