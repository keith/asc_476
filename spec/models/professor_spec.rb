require 'spec_helper'

describe Professor do
  before { @prof = FactoryGirl.create(:professor) }
  subject { @prof }
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:identifier) }
  it { should be_valid }

  describe 'invalid fields' do
    before { @invalid = Professor.new }
    specify { @invalid.should_not be_valid }
  end

  describe 'a professor should generate a token' do
    specify { expect(@prof.identifier.present?).to be_true }
  end

  describe 'lowercase emails' do
    before do
      Professor.delete_all
      @prof.email = 'AbC'
      @prof.save!
    end

    specify { expect(@prof.email == 'abc').to be_true }
  end

  describe 'changing identifiers' do
    before { @prof.identifier = 'abc' }
    it { should_not be_valid }
  end

  describe 'changing professor emails' do
    context 'email changed' do
      before do
        @prof.email = @prof.email + 'a'
        @prof.save!
      end

      it 'should send an email' do
        ActionMailer::Base.deliveries.count.should == 1
      end
    end

    context 'unchanged email' do
      before { @prof.save! }

      it 'should not send an email' do
        ActionMailer::Base.deliveries.count.should == 0
      end
    end

    context 'email case changed' do
      before do
        @prof.email = @prof.email.upcase
        @prof.save!
      end

      it 'should not send an email' do
        ActionMailer::Base.deliveries.count.should == 0
      end
    end
  end
end
