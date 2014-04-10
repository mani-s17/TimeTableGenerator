require 'spec_helper'
include ApiHelper

describe ApiHelper do
  let(:standards) { 2 }
  let(:subjects) { %w(PUN SCI MAT) }
  let(:hours) { 4 }

  describe 'extract_teacher_map' do
    before do
      @teacher = FactoryGirl.create(:teacher_with_subjects, standards: standards, subjects: subjects)
    end

    let(:result) { extract_teacher_map(@teacher) }

    it 'should have proper id' do
      expect(result['id']).to eq @teacher.id
    end

    it 'should have proper hours' do
      expect(result['hours']).to eq @teacher.teaching_hours
    end

    it 'should have proper standard to subject map' do
      expected_map = {1 => subjects, 2 => subjects}
      expect(result['standardToSubjectMap']).to eq expected_map
    end
  end

  describe 'extract_class_group_map' do
    before do
      @class_group = FactoryGirl.create(:class_group_with_subjects, subjects: subjects, hours: hours)
    end
    let(:result) { extract_class_group_map(@class_group) }

    it 'should have proper id' do
      expect(result['id']).to eq @class_group.id
    end

    it 'should have standard id' do
      expect(result['standardId']).to eq @class_group.standard_id
    end

    it 'should have proper subject to hour map' do
      expected_map = {'PUN' => hours, 'SCI' => hours, 'MAT' => hours}
      expect(result['subjectToHourMap']).to eq expected_map
    end
  end

  describe 'extract_api_input' do
    before do
      @class_group = FactoryGirl.create(:class_group_with_subjects, subjects: subjects, hours: hours)
      @teacher = FactoryGirl.create(:teacher_with_subjects, standards: standards, subjects: subjects)
    end
    let(:result) { extract_api_input }

    it 'should have no of working days' do
      expect(result['workingDays']).to eq 5
    end

    it 'should have no of periods per day' do
      expect(result['periodPerDay']).to eq 8
    end

    it 'should have teachers input details' do
      expect(result['teachers']).not_to eq nil
    end

    it 'should have class_groups input details' do
      expect(result['classGroups']).not_to eq nil
    end
  end
end
