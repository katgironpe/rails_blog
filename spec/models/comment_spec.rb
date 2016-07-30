require 'rails_helper'

describe Comment do
  let(:comment) { create(:comment) }

  it { should belong_to(:commentable) }

  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:body) }

  describe '#as_json' do
    it 'only returns user_name and body' do
      expect(comment.as_json).to eq({"id" => comment.id, "user_name" => comment.user_name, "body" => comment.body})
    end
  end
end
