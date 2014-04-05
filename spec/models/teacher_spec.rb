require 'spec_helper'

describe Teacher do
  before do
    @name = "Tim Roughgarden's"
    @teaching_hours = 4
    @teacher = FactoryGirl.build(:teacher, name: @name, teaching_hours: @teaching_hours)
  end
  subject { @teacher }
  it { should respond_to(:name) }
  it { should respond_to(:teaching_hours) }
  it { should respond_to(:subject_standards) }
  it { should respond_to(:teacher_subject_standards) }
  its(:name) { should == @name }
  its(:teaching_hours) { should == @teaching_hours }
  it { should be_valid }

  describe "without name" do
    before { @teacher.name = nil }
    it { should_not be_valid }
  end

  describe "without teaching hours" do
    before { @teacher.teaching_hours = nil }
    it { should_not be_valid }
  end

  describe "Teaching hours" do
    describe "should have lower limit" do
      before { @teacher.teaching_hours = -1 }
      it { should_not be_valid }
    end

    describe "should have upper limit" do
      before { @teacher.teaching_hours = 41 }
      it { should_not be_valid }
    end
  end

  describe "Name" do
    describe "should not be blank" do
      before { @teacher.name = "" }
      it { should_not be_valid }
    end

    describe "should not be too long" do
      before { @teacher.name = "a" * 51 }
      it { should_not be_valid }
    end
  end

  describe 'Teacher Subject Standards' do
    before { @teacher.save }
    let!(:teacher_subject_standard1) { FactoryGirl.create(:teacher_subject_standard, teacher: @teacher) }
    let!(:teacher_subject_standard2) { FactoryGirl.create(:teacher_subject_standard, teacher: @teacher) }

    it "be present" do
      expect(@teacher.teacher_subject_standards).to eq [teacher_subject_standard1, teacher_subject_standard2]
    end

    it "should have subject standards" do
      expect(@teacher.subject_standards).to eq [teacher_subject_standard1.subject_standard, teacher_subject_standard2.subject_standard]
    end
  end
end
