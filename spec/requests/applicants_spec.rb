require 'spec_helper'

describe "Applicants" do
  before do
    @admin = FactoryGirl.create(:admin)
    visit signin_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign in'
  end

  describe "GET /applicant/:id" do
    before do
      @applicant = FactoryGirl.create(:applicant)
      visit applicant_path(@applicant)
    end

    it "should have the url /applicant/:hash" do
      current_path.should == "#{applicants_path}/#{@applicant.identifier}"
    end
  end
end

