require 'spec_helper'

describe ProfessorsHelper do
  describe 'new_professor_identifier' do
    it 'should return long identifier' do
      expect(helper.new_professor_identifier.length >= 32).to be_true
    end

    it 'should not return the same thing twice (probably)' do
      expect(helper.new_professor_identifier).not_to eq(helper.new_professor_identifier)
    end
  end
end

