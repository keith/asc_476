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

  describe "user permissions" do
    describe "an admin" do
      it "should be an admin" do
        @admin.admin?.should be_true
      end

      it "should be a moderator" do
        @admin.moderator?.should be_true
      end
    end

    describe "a moderator" do
      before { @mod = FactoryGirl.create(:moderator) }
      specify { @mod.admin?.should be_false }
      specify { @mod.moderator?.should be_true }
    end
  end
end
