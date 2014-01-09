require 'spec_helper'

describe User do
  before do
    @admin = FactoryGirl.create(:admin)
  end

  subject { @admin }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:level) }
  it { should be_valid }

  describe "user with invalid fields" do
    before { @invalid = User.new }
    specify { @invalid.should_not be_valid }
  end
end
