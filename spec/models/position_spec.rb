require 'spec_helper'

describe Position do
  before { @position = FactoryGirl.create(:position) }
  subject { @position }

  it { should respond_to(:applicant) }
  it { should respond_to(:course) }
  it { should respond_to(:professor) }
  it { should respond_to(:identifier) }
  it { should be_valid }

  describe 'identifier is immutable' do
      specify { expect{ @position.update_attributes!(identifier: 123) }.to raise_exception(/can't be changed/) }
  end

  describe 'applicant association' do
    describe 'without applicant' do
      before { @position.applicant = nil }
      it { should_not be_valid }
    end

    describe 'with non-existant applicant' do
      before { @position.applicant_id = 0 }
      it { should_not be_valid }
    end

    describe 'with existant applicant' do
      before {
        @applicant = FactoryGirl.create(:applicant)
        @position.applicant = @applicant
      }
      it { should be_valid }
    end
  end

  describe 'professor association' do
    describe 'without professor' do
      before { @position.professor = nil }
      it { should_not be_valid }
    end

    describe 'with non-existant professor' do
      before { @position.professor_id = 0 }
      it { should_not be_valid }
    end

    describe 'with existant professor' do
      before {
        @professor = FactoryGirl.create(:professor)
        @position.professor = @professor
      }
      it { should be_valid }
    end
  end

  describe 'validates application status' do
    describe 'too low' do
      before { @position.application_status = -1 }
      it { should_not be_valid }
    end

    describe 'too high' do
      before { @position.application_status = Status.names.count + 100 }
      it { should_not be_valid }
    end

    describe 'in range' do
      before { @position.application_status = Status.names.count / 2 }
      it { should be_valid }
    end
  end
end
