require 'spec_helper'

describe 'Professors' do
  before { @prof = FactoryGirl.create(:professor) }
  subject { @prof }

  describe 'viewing the correct path' do
    before { visit professor_path(@prof) }

    it 'should be based on the identifier' do
      current_path.end_with?(@prof.identifier).should be_true
    end
  end

  describe 'viewing an invalid path' do
    it 'should raise an error' do
      expect {
        visit professor_path('abc')
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'changing a professor email' do
    describe 'not logged in' do
      before { visit edit_professor_path(@prof) }

      it 'should not allow the change' do
        expect(page).to have_content("Contact the ASC")
      end
    end

    describe 'when logged in' do
      before do
        @admin = FactoryGirl.create(:admin)
        visit signin_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: 'abcdef'
        click_button 'Sign in'
        visit edit_professor_path(@prof)
      end

      it 'should allow the edit' do
        expect(@prof.email).not_to eq('abc@example.com')
        fill_in 'Email', with: 'abc@example.com'
        click_button 'Update'
        expect(@prof.reload.email).to eq('abc@example.com')
      end
    end
  end
end
