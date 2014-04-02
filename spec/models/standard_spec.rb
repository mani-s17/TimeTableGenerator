require 'spec_helper'

describe Standard do
  before do
    @name = "2nd"
    @standard = FactoryGirl.build(:standard, name: @name)
  end
  subject { @standard }

  it { should respond_to(:name) }
  it { should respond_to(:class_groups) }
  its(:name) { should == @name }
  it { should be_valid }

  describe "without name" do
    before { @standard.name = nil }
    it { should_not be_valid }
  end

  describe 'standard to group association' do
    before { @standard.save }
    let!(:class_group1) { FactoryGirl.create(:class_group, standard: @standard) }
    let!(:class_group2) { FactoryGirl.create(:class_group, standard: @standard) }

    it 'should have proper class groups' do
      expect(@standard.class_groups).to eq [class_group1, class_group2]
    end

    it 'should delete associated groups' do
      groups = @standard.class_groups
      expect(groups).not_to be_empty
      @standard.destroy
      groups.each do |group|
        expect(ClassGroup.where(id: group.id)).to be_empty
      end
    end
  end
end
