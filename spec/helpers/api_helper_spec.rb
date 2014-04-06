require 'spec_helper'
include ApiHelper

describe ApiHelper do
  let(:standards) { 2 }
  let(:subjects) { ['PUN', 'SCI', 'MAT'] }
  before do
    @teacher = FactoryGirl.create(:teacher_with_subjects, standards: standards, subjects: subjects)
  end

  describe 'extract_teacher_map' do
    let(:result) { extract_teacher_map(@teacher) }

    it "should have proper id" do
      expect(result['id']).to eq @teacher.id
    end

    it "should have proper hours" do
      expect(result['hours']).to eq @teacher.teaching_hours
    end

    it "should have proper standard to subject map" do
      mp = {1 => subjects, 2 => subjects}
      expect(result['standardToSubjectMap']).to eq mp
    end
  end
end
