require 'spec_helper'

describe Teacher do
  before do
    @name = "Tim Roughgarden's"
    @teaching_hours = 4
    @teacher = FactoryGirl.build(:teacher, name: @name, teaching_hours: @teaching_hours)
  end
  subject { @teacher }
  it { should be_valid }
  its(:name) { should == @name }
  its(:teaching_hours) { should == @teaching_hours }

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


end
