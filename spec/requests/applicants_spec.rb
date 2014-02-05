require 'spec_helper'

describe "Applicants" do
  before do
    @admin = FactoryGirl.create(:admin)
    visit signin_path
    fill_in 'Email', with: @admin.email
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign in'
  end

  describe "GET applicant_path(@applicant)" do
    before do
      @applicant = FactoryGirl.create(:applicant)
      visit applicant_path(@applicant)
    end

    it "should be at url /applicant/:hash" do
      current_path.should == "#{applicants_path}/#{@applicant.identifier}"
    end

  end

  describe "GET applicant_path(@applicant)" do
    before do
      visit applicants_path
    end

    it 'should have the correct HTML' do
      expect(page).to have_content('Listing applicants')
    end

    it 'should list all applicants' do
      Applicant.all.each do |applicant|
        expect(page).to have_content(applicant.name)
      end
    end
  end
end

