require 'spec_helper'

describe Subject do
  before do
    @subjectName ="Maths";
    @code = "MAT"
    @subject = FactoryGirl.build(:subject, name: @subjectName, code: @code)
  end

  subject { @subject }

  it { should respond_to(:name) }
  it { should respond_to(:code) }
  its(:name) { should == @subjectName }
  its(:code) { should == @code }
  it { should be_valid }

  describe "without name" do
    before { @subject.name = nil }
    it { should_not be_valid }
  end

  describe "without code" do
    before { @subject.code=nil }
    it { should_not be_valid }
  end
end
