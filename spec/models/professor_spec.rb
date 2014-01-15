require 'spec_helper'

describe Professor do
  before { @prof = FactoryGirl.create(:professor) }
  subject { @prof }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:identifier) }
  it { should be_valid }

  describe 'invalid fields' do
    before { @invalid = Professor.new }
    specify { @invalid.should_not be_valid }
  end

  describe 'a professor should generate a token' do
    before { @prof.valid? }
    specify { expect(@prof.identifier.present?).to be_true }
  end

  describe 'lowercase emails' do
    before do
      Professor.delete_all
      @prof.email = 'AbC@dEf.com'
      @prof.save!
    end

    specify { expect(@prof.email == 'abc@def.com').to be_true }
  end

  describe 'changing identifiers' do
    before { @prof.identifier = 'abc' }
    it { should_not be_valid }
  end
end
