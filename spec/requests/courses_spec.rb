require 'spec_helper'

describe 'Courses' do
  before do
    @admin = FactoryGirl.create(:admin)
    visit signin_path
    fill_in 'Email Address', with: @admin.email
    fill_in 'Password', with: 'abcdef'
    click_button 'Sign in'
  end

  describe 'GET /courses' do
    before do
      @course = FactoryGirl.create(:course)
      @course.save
      visit courses_path
    end

    it 'should be on the correct page' do
      current_path.should == courses_path
    end

    it 'should have the correct HTML' do
      expect(page).to have_content('Listing courses')
      expect(page).to have_button('Update Courses')
      expect(page).to have_link('New Course',  new_course_path)
      expect(page).to have_content(@course.designator)
      expect(page).to have_content(@course.number)
    end
  end

  describe 'GET /courses/new' do
    before do
      @course = FactoryGirl.build(:course)
      visit new_course_path
    end

    it 'should be on the correct page' do
      current_path.should == new_course_path
    end

    it 'should have the correct HTML' do
      expect(page).to have_content('New course')
      expect(page).to have_field('Designator', type: 'text')
      expect(page).to have_button('Create Course')
    end

    it 'should create a new course' do
      fill_in 'Designator', with: @course.designator
      fill_in 'Number', with: @course.number
      expect {
        click_button 'Create Course'
      }.to change(Course, :count).by(1)
      current_path.should == courses_path
      expect(page).to have_content(@course.designator)
      expect(page).to have_content(@course.number)
    end
  end
end
