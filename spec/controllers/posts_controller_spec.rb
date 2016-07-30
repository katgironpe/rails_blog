require 'rails_helper'

describe PostsController do

  let(:valid_attributes) { attributes_for(:post) }

  describe '#index' do
    it 'assigns all posts as @posts' do
      post = Post.create! valid_attributes
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe '#show' do
    it 'assigns the requested post as @post' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)
      expect(assigns(:title)).to eq(post.title)
    end
  end
end
