require 'rails_helper'

describe CommentsController do

  let(:post) { create(:post) }
  let(:valid_attributes) { attributes_for(:comment, commentable_id: post.id, commentable_type: 'Post') }

  let(:invalid_attributes) { attributes_for(:comment, commentable_id: '') }

  describe '#index' do
    context "without post_id parameter" do
      before do
        create(:comment)
      end

      it 'assigns all comments as @comments' do
        comment = Comment.create! valid_attributes
        get :index, xhr: true
        expect(assigns(:comments).count).to eq(2)
        expect(response.code).to eq('200')
      end
    end

    context "with post_id parameter" do
      it 'assigns all comments as @comments' do
        comment = Comment.create! valid_attributes
        get :index, post_id: post.id, xhr: true
        expect(assigns(:comments)).to eq([comment])
        expect(assigns(:comments).count).to eq(1)
        expect(response.code).to eq('200')
      end
    end
  end

  describe '#show' do
    it 'assigns the requested comment as @comment' do
      comment = Comment.create! valid_attributes
      get :show, params: {id: comment.to_param}, xhr: true
      expect(assigns(:comment)).to eq(comment)
      expect(response.code).to eq('200')
    end
  end
end
