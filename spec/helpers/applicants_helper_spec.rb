require 'spec_helper'

describe ApplicantsHelper do
  describe 'new_applicant_identifier' do
    it 'should return a long identifier' do
      expect(helper.new_applicant_identifier.length >= 36).to be_true
    end

    it 'should not return the same identifier twice (probably)' do
      expect(helper.new_applicant_identifier).not_to eq(helper.new_applicant_identifier)
    end
  end
end

