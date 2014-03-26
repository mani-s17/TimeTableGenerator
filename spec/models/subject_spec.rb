require 'spec_helper'

describe Subject do
  before do
    @subjectName ="Maths";
    @subject = FactoryGirl.build(:subject, name: @subjectName)
  end

  subject { @subject }

  it { should respond_to(:name) }
  its(:name) { should == @subjectName }
  it { should be_valid }

  describe "without name" do
    before { @subject.name = nil }
    it { should_not be_valid }
  end
end
