require 'spec_helper'

describe GroupSubject do
  before do
    @class_group = FactoryGirl.build(:class_group)
    @subject = FactoryGirl.build(:subject)
    @group_subject = FactoryGirl.build(:group_subject, class_group: @class_group, subject: @subject)
  end

  subject { @group_subject }

  it { should respond_to(:subject) }
  it { should respond_to(:class_group) }
  it { should be_valid }

  its(:class_group) { should == @class_group }
  its(:subject) { should == @subject }

  describe 'without subject' do
    before { @group_subject.class_group = nil }
    it { should_not be_valid }
  end

  describe 'without subject' do
    before { @group_subject.subject = nil }
    it { should_not be_valid }
  end

end
