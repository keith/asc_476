require 'spec_helper'

describe 'Users' do
  let(:bobemail) { 'bob@example.com' }

  describe 'deleting last administrator' do
    before do
      @admin = FactoryGirl.create(:admin)
      @admin2 = FactoryGirl.create(:admin)
      visit signin_path
      fill_in 'Email', with: @admin.email
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign in'
    end

    it 'should allow the deletion of one of the admins' do
      visit users_path
      current_path.should == users_path
      expect(page).to have_content(@admin2.email)
      expect {
        find(:xpath, "//a[@href='/users/#{ @admin2.id }']").click
      }.to change(User, :count).by(-1)
      current_path.should == users_path
      expect(page).not_to have_content(@admin2.email)
      expect(page).to have_content('User was deleted')
      expect {
        find(:xpath, "//a[@href='/users/#{ @admin.id }']").click
      }.to change(User, :count).by(0)
      current_path.should == users_path
      expect(page).to have_content(@admin.email)
      expect(page).to have_content('Cannot delete')
    end
  end

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
        fill_in 'Email', with: bobemail
        expect {
          click_button 'Create User'
        }.to change(User, :count).by(1)
        current_path.should == users_path
        expect(page).to have_content(bobemail)
      end
    end

    describe 'POST /users' do
      before do
        visit new_user_path
        fill_in 'Email', with: ''
      end

      it 'should require an email' do
        click_button 'Create User'
        expect(page).to have_content("Email can't be blank")
        expect(page).not_to have_content('User was successfully')
      end
    end

    describe 'PUT /users/id' do
      before { visit edit_user_path(@admin) }

      it 'should be on the right page' do
        current_path.should == edit_user_path(@admin)
        expect(page).to have_content('Editing user')
        expect(page).to have_field('Email', with: @admin.email)
        expect(page).to have_field('Name', with: @admin.name)
      end

      it 'should be able to change the user' do
        fill_in 'Email', with: bobemail
        expect {
          click_button 'Update User'
        }.not_to change(User, :count)
        current_path.should == users_path
        expect(page).to have_content(bobemail)
        expect(@admin.reload.email).to eq(bobemail)
      end
    end

    describe 'DELETE /users/id' do
      before do
        @user = FactoryGirl.create(:moderator)
        visit users_path
      end

      it 'should allow admins to delete users' do
        expect(page).to have_content(@user.email)
        expect {
          find(:xpath, "//a[@href='/users/#{ @user.id }']").click
        }.to change(User, :count).by(-1)
        current_path.should == users_path
        expect(page).not_to have_content(@user.email)
      end
    end
  end

  describe 'current user' do
    let(:bobemail) { 'bob@example.com' }
    before do
      @admin = FactoryGirl.create(:admin)
      @user = FactoryGirl.create(:moderator)
      visit signin_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign in'
    end

    it 'should be able to see its own edit page' do
      visit edit_user_path(@user)
      current_path.should == edit_user_path(@user)
      expect(page).to have_content('Editing user')
    end

    it 'should be able to edit its own user' do
      visit edit_user_path(@user)
      fill_in 'Email', with: bobemail
      click_button 'Update User'
      expect(@user.reload.email).to eq(bobemail)
    end

    it 'should not  be able to visit other users edit pages' do
      visit edit_user_path(@admin)
      current_path.should == applicants_path
    end
  end

  describe 'moderators' do
    before do
      @mod = FactoryGirl.create(:moderator)
      visit signin_path
      fill_in 'Email', with: @mod.email
      fill_in 'Password', with: 'abcdef'
      click_button 'Sign in'
    end

    describe 'GET /users' do
      before { visit users_path }

      it 'should redirect moderators' do
        current_path.should == applicants_path
      end
    end

    describe 'GET /users/new' do
      before { visit new_user_path }

      it 'should redirect moderators' do
        current_path.should == applicants_path
      end
    end
  end

  describe 'invalid users' do
    describe 'GET /users' do
      it 'should redirect invalid users' do
        visit users_path
        current_path.should == signin_path
      end
    end

    describe 'GET /users/new' do
      it 'should redirect invalid users' do
        visit new_user_path
        current_path.should == signin_path
      end
    end
  end
end
