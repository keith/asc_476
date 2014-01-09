require 'spec_helper'

describe Course do
  before { @course = FactoryGirl.create(:course) }
  subject { @course }

  it { should respond_to(:designator) }
  it { should respond_to(:number) }
  it { should respond_to(:hidden) }
  it { should respond_to(:disabled) }
  it { should be_valid }

  describe "helper methods" do
    describe "hidden?" do
      before { @course.hidden = true }
      specify { expect(@course.hidden?).to be_true }
      specify { expect(@course.disabled?).to be_false }
    end

    describe "disabled?" do
      before { @course.disabled = true }
      specify { expect(@course.hidden?).to be_true }
      specify { expect(@course.disabled?).to be_true }
    end
  end

  describe "uniqueness" do
    describe "two courses with different numbers" do
      before do
        @course1 = Course.create!(designator: "CSCI", number: 123)
        @course2 = Course.create!(designator: "CSCI", number: 456)
      end

      specify { @course1.should be_valid }
      specify { @course2.should be_valid }
    end

    describe "two courses with the same numbers" do
      before do
        @course1 = Course.create!(designator: "CSCI", number: 123)
        @course2 = Course.new(designator: "CSCI", number: 123)
      end

      specify { @course1.should be_valid }
      specify { @course2.should_not be_valid }
      specify { expect{ @course2.save! }.to raise_exception(/Designator has already been taken/) }
    end
  end
end
