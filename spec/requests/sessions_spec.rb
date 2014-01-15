require 'spec_helper'

describe 'Sessions' do
  before { @admin = FactoryGirl.create(:admin) }

  describe 'GET /signin' do
    it 'should render the correct template' do
      get signin_path
      expect(response).to render_template(:new)
    end

    it 'should be on the correct page' do
      visit signin_path
      expect(page).to have_content('Login')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end
  end

  describe 'POST /sessions' do
    before { visit signin_path }

    describe 'valid user' do
      it 'should allow valid users to login' do
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: 'abcdef'
        click_button 'Sign in'
        visit new_course_path
        current_path.should == new_course_path
      end
    end

    describe 'invalid user' do
      it 'should not allow invalid users' do
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: ''
        click_button 'Sign in'
        current_path.should == signin_path
        expect(page).to have_content('Invalid email/password')
      end
    end
  end

  describe 'DELETE /signout' do
    it 'should redirect to the /signin' do
      delete signout_path
      expect(response).to redirect_to(signin_path)
    end
  end
end

