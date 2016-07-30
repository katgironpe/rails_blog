require 'rails_helper'

describe Post do
  it { should belong_to(:user).inverse_of(:posts) }
  it { should have_many(:comments).dependent(:destroy) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  describe '#author_name' do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }

    it 'returns author name' do
      expect(post.author_name).to eq(user.name)
    end
  end
end
