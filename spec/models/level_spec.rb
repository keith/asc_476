require 'spec_helper'

describe Level do
  describe 'default levels' do
    before { @level = Level.levels.sample }
    it 'should return the default levels' do
      Level.levels.count.should == 2
      expect(Level.names.include? 'Administrator').to be_true
      expect(Level.names.include? 'Moderator').to be_true
    end

    it 'should return the correct levels for numbers' do
      Level.for_number(0).name.should == 'Administrator'
      Level.for_number(5).should be_nil
      Level.for_number(2).name.should == 'Moderator'
    end

    it 'should return the description' do
      @level.description.should =~ /#{ @level.name } - \w/
    end
  end
end

