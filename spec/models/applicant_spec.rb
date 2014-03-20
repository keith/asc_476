require 'spec_helper'

describe Applicant do
  before { @applicant = FactoryGirl.create(:applicant) }
  subject { @applicant }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:wuid) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:class_standing) }
  it { should respond_to(:gpa) }
  it { should respond_to(:gpa_timestamp) }
  it { should respond_to(:comment) }
  it { should respond_to(:major) }
  it { should respond_to(:minor) }
  it { should respond_to(:work_study) }
  it { should respond_to(:identifier) }
  it { should be_valid }

  describe 'invalid states' do
    describe 'empty applicant object' do
      before { @invalid = Applicant.new }
      specify { @invalid.should_not be_valid }
    end

    describe 'non-unique email' do
      before do
        Applicant.delete_all
        @good = FactoryGirl.build(:applicant)
        @good.email = 'smithj1'
        @good.save!
        @bad = FactoryGirl.build(:applicant)
        @bad.email = @good.email
      end

      specify { @bad.should_not be_valid }
      specify { @good.should be_valid }
    end
  end

  describe 'gpa timestamp changed on update' do
    before do
      @old_timestamp = @applicant.gpa_timestamp
      @applicant.update_attributes(gpa: 3.7)
      @new_timestamp = @applicant.gpa_timestamp
    end
    specify { @new_timestamp.should_not eq(@old_timestamp) }
  end

  describe 'identifier is immutable' do
      specify { expect{ @applicant.update_attributes!(identifier: 123) }.to raise_exception(/can't be changed/) }
  end

  describe 'email cannot have suffix' do
    before do
      @applicant.email = "foo#{ EMAIL_SUFFIX }"
    end

    it { should_not be_valid }
  end

  describe 'phone number length' do
    context 'too short' do
      before do
        @applicant.phone_number = 123
      end

      it { should_not be_valid }
    end

    context 'long enough' do
      before do
        @applicant.phone_number = 1234567890
      end

      it { should be_valid }
    end
  end
end
