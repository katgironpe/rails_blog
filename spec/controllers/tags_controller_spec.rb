require 'rails_helper'

describe TagsController do

  let(:tag) { create(:tag) }
  let(:posts) { create(:posts) }
  let(:tagging) { create(:tagging, tag_id: tag.id, taggable_id: post.id) }

  describe "GET #index" do
    it "returns http success" do
    end

    context 'with exists posts for a tag' do
      it 'returns success status' do
        get :index, params: { resource_type: 'posts', name: tag.name }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
