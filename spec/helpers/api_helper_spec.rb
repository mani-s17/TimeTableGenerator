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
      expected_map = {1 => subjects, 2 => subjects}
      expect(result['standardToSubjectMap']).to eq expected_map
    end
  end

  describe 'extract_class_group_map' do
    let(:hours) { 4 }
    before do
      @class_group = FactoryGirl.create(:class_group_with_subjects, subjects: subjects, hours: hours)
    end

    let(:result) { extract_class_group_map(@class_group) }

    it "should have proper id" do
      expect(result['id']).to eq @class_group.id
    end

    it "should have proper subject to hour map" do
      expected_map = {'PUN' => hours, 'SCI' => hours, 'MAT' => hours}
      expect(result['subjectToHourMap']).to eq expected_map
    end

  end
end
