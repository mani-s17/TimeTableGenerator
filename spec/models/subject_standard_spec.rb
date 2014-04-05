require 'spec_helper'

describe SubjectStandard do
  before do
    @subject = FactoryGirl.build(:subject)
    @standard = FactoryGirl.build(:standard)
    @subject_standard = FactoryGirl.build(:subject_standard, subject: @subject, standard: @standard)
  end

  subject { @subject_standard }

  it { should respond_to(:subject) }
  it { should respond_to(:standard) }
  its(:subject) { should == @subject }
  its(:standard) { should == @standard }
  it { should be_valid }

  describe 'without subject' do
    before { @subject_standard.subject = nil }
    it { should_not be_valid }
  end

  describe 'without standard' do
    before { @subject_standard.standard = nil }
    it { should_not be_valid }
  end
end
