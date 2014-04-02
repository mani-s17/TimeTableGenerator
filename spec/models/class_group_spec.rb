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

end
