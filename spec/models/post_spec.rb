require 'rails_helper'

describe Post do
  it { should belong_to(:user).inverse_of(:posts) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  describe '#author_name' do
    let!(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    it 'returns author name' do
      expect(post.author_name).to eq(user.name)
    end
  end

  describe '#tag_names' do
    let(:tag) { create(:tag) }
    let(:tag2) { create(:tag, name: 'movie') }

    let(:post) { create(:post) }

    before do
      create(:tagging, taggable_id: post.id, tag_id: tag.id)
      create(:tagging, taggable_id: post.id, tag_id: tag2.id)
      post.reload
    end

    it 'returns list of tags by name' do
      expect(post.tag_names).to eq(%(#{tag2.name}, #{tag.name}))
    end
  end
end
