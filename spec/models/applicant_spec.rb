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

  describe "invalid states" do
    describe "empty applicant object" do
      before { @invalid = Applicant.new }
      specify { @invalid.should_not be_valid }
    end

    describe "non-unique email" do
      before do
        Applicant.delete_all
        @good = Applicant.create!(name: "Joe", email: "smithj1@winthrop.edu")
        @bad = Applicant.new(name: "Jane", email: "smithj1@winthrop.edu")
      end

      specify { @bad.should_not be_valid }
      specify { @good.should be_valid }
    end
  end

  describe "gpa timestamp changed on update" do
    before do
      @old_timestamp = @applicant.gpa_timestamp
      @applicant.update_attributes(gpa: 3.7)
      @new_timestamp = @applicant.gpa_timestamp
    end
    specify { @new_timestamp.should_not eq(@old_timestamp) }
  end

  describe "identifier is immutable" do
      specify { expect{ @applicant.update_attributes!(identifier: 123) }.to raise_exception(/can't be changed/) }
  end
end
