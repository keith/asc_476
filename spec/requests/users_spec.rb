require 'spec_helper'

describe 'Users' do
  describe 'admins' do
    before do
      @admin = FactoryGirl.create(:admin)
      visit signin_path
      fill_in 'Email', with: @admin.email
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign in'
    end

    describe 'GET /users' do
      before { visit users_path }

      it 'should allow access to admins' do
        current_path.should == users_path
      end

      it 'should have the current user account' do
        expect(page).to have_content(@admin.email)
      end
    end

    describe 'GET /users/new' do
      before { visit new_user_path }

      it 'should allow access to admins' do
        current_path.should == new_user_path
      end

      it 'should be on the right page' do
        expect(page).to have_content('New user')
      end

      it 'should be able to add a user' do
        fill_in 'Name', with: 'bob'
        fill_in 'Email', with: 'bob@example.com'
        expect {
          click_button 'Create User'
        }.to change(User, :count).by(1)
        current_path.should == users_path
      end
    end
  end

  describe 'invalid users' do
    describe 'GET /users' do
      it 'should redirect invalid users' do
        visit signin_path
        current_path.should == signin_path
      end

      describe 'moderator' do
        before do
          @mod = FactoryGirl.create(:moderator)
          visit signin_path
          fill_in 'Email', with: @mod.email
          fill_in 'Password', with: 'abcdef'
          click_button 'Sign in'
          visit users_path
        end

        it 'should redirect moderators users' do
          current_path.should == signin_path
        end
      end
    end
  end
end

