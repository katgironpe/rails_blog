require 'rails_helper'

describe Tag do

  it { should have_many(:taggings).inverse_of(:tag) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe '.filter_by_name' do
    let(:tag) { create(:tag) }

    context 'with an existing tag, it returns tag based on name' do
      it 'returns first tag' do
        expect(Tag.filter_by_name(tag.name)).to eq(tag)
      end
    end
  end
end
