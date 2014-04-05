require 'spec_helper'

describe TeacherSubjectStandard do
  before do
    @teacher = FactoryGirl.build(:teacher)
    @subject_standard = FactoryGirl.build(:subject_standard)
    @teacher_subject_standard = FactoryGirl.build(:teacher_subject_standard, teacher: @teacher, subject_standard: @subject_standard)
  end

  subject { @teacher_subject_standard }

  it { should respond_to(:teacher) }
  it { should respond_to(:subject_standard) }
  its(:teacher) { should == @teacher }
  its(:subject_standard) { should == @subject_standard }
  it { should be_valid }

  describe 'without teacher' do
    before { @teacher_subject_standard.teacher = nil }
    it { should_not be_valid }
  end

  describe 'without subject_standard' do
    before { @teacher_subject_standard.subject_standard = nil }
    it { should_not be_valid }
  end
end
