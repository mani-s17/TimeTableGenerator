require 'spec_helper'

describe ClassGroup do

  before do
    @name = 'Sub1'
    @size = 33
    @standard = FactoryGirl.build(:standard)
    @class_group =FactoryGirl.build(:class_group, name: @name, standard: @standard, size: @size)
  end

  subject { @class_group }
  it { should respond_to(:name) }
  it { should respond_to(:size) }
  it { should respond_to(:standard) }
  it { should respond_to(:subjects) }
  it { should respond_to(:group_subjects) }
  it { should be_valid }

  its(:name) { should == @name }
  its(:size) { should == @size }
  its(:standard) { should == @standard }

  describe 'without name' do
    before { @class_group.name = nil }
    it { should_not be_valid }
  end

  describe 'without size' do
    before { @class_group.size = nil }
    it { should_not be_valid }
  end

  describe 'without standard' do
    before { @class_group.standard = nil }
    it { should_not be_valid }
  end

  describe 'size' do
    describe 'should have lower limit' do
      before { @class_group.size = -10 }
      it { should_not be_valid }
    end

    describe 'should have upper limit' do
      before { @class_group.size = 101 }
      it { should_not be_valid }
    end
  end


  describe 'Group Subjects' do
    before { @class_group.save }
    let!(:group_subject1) { FactoryGirl.create(:group_subject, class_group: @class_group) }
    let!(:group_subject2) { FactoryGirl.create(:group_subject, class_group: @class_group) }

    it "should be present" do
      expect(@class_group.group_subjects).to eq [group_subject1, group_subject2]
    end

    it "should have subjects" do
      expect(@class_group.subjects).to eq [group_subject1.subject, group_subject2.subject]
    end
  end


end
