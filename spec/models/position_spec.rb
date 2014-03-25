require 'spec_helper'

describe Position do
  before { @position = FactoryGirl.create(:position) }
  subject { @position }

  it { should respond_to(:applicant) }
  it { should respond_to(:course) }
  it { should respond_to(:professor) }
  it { should respond_to(:identifier) }

  describe 'identifier is immutable' do
      specify { expect{ @position.update_attributes!(identifier: 123) }.to raise_exception(/can't be changed/) }
  end
end
