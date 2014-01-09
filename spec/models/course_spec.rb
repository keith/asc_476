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
end
