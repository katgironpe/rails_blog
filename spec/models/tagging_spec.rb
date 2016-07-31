require 'rails_helper'

describe Tagging do
  it { should belong_to(:tag).inverse_of(:taggings) }
  it { should belong_to(:taggable) }

  it { should validate_presence_of(:tag_id) }

  describe '#resource' do
    context 'when the resource is a post' do
      let(:post) { create(:post) }
      let(:tagging) { create(:tagging, taggable_id: post.id) }

      it 'returns the post resource' do
        expect(tagging.resource).to eq(post)
      end
    end
  end
end
