require 'spec_helper'

describe SessionsHelper do
  before { @user = FactoryGirl.create(:admin) }

  describe 'sign_in' do
    it 'should update the user with a token' do
      expect(@user.remember_token).to be_nil
      helper.sign_in(@user)
      expect(@user.remember_token).not_to be_nil
    end

    it 'should set current_user' do
      expect(helper.current_user).to be_nil
      helper.sign_in(@user)
      expect(helper.current_user).to eq(@user)
    end
  end

  describe 'sign_out' do
    before { helper.sign_in(@user) }

    it 'should delete the remember_token' do
      expect(@user.remember_token).not_to be_nil
      helper.sign_out
      expect(@user.remember_token).to be_nil
    end

    it 'should nil the current_user' do
      expect(helper.current_user).not_to be_nil
      helper.sign_out
      expect(helper.current_user).to be_nil
    end
  end
end

