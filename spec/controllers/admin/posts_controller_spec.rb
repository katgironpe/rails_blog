require 'rails_helper'

describe Admin::PostsController do

  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:post).merge(user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:post, title: '', body: '') }

  describe '#index' do
    it_behaves_like 'a restricted index page action'

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns all posts as @posts' do
        post = Post.create! valid_attributes
        get :index
        expect(assigns(:posts)).to eq([post])
      end
    end
  end

  describe '#show' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        post = Post.create! valid_attributes
        get :show, params: { id: post.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns the requested post as @post' do
        post = Post.create! valid_attributes
        get :show, params: { id: post.to_param }
        expect(assigns(:post)).to eq(post)
      end
    end
  end

  describe '#new' do
    it_behaves_like 'a restricted new page action'

    context 'when user is signed in' do
      before { sign_in_user }

      it 'returns http success' do
        get :new
        expect(response).to be_success
      end

      it 'assigns a new post as @post' do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe '#edit' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        post = Post.create! valid_attributes
        get :edit, params: {id: post.to_param}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns the requested post as @post' do
        post = Post.create! valid_attributes
        get :edit, params: {id: post.to_param}
        expect(assigns(:post)).to eq(post)
      end
    end
  end

  describe '#create' do
    context 'with valid params' do
      before { sign_in_user }

      it 'creates a new Post' do
        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it 'assigns a newly created post as @post' do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(admin_post_path(Post.last))
      end
    end

    context 'with invalid params' do
      before { sign_in_user }

      it 'assigns a newly created but unsaved post as @post' do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 're-renders the new template' do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe '#update' do
    let(:new_attributes) { { title: 'Test' }}

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with valid params' do
      before { sign_in_user }

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload
        expect(response).to redirect_to(admin_post_path(post))
      end

      it 'assigns the requested post as @post' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it 'redirects to the post' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(response).to redirect_to(admin_post_path(post))
      end
    end

    context 'with invalid params' do
      before { sign_in_user }

      it 'assigns the post as @post' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it 're-renders the edit template' do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe '#destroy' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        post = Post.create! valid_attributes
        delete :destroy, params: {id: post.to_param}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'destroys the requested post' do
        post = Post.create! valid_attributes
        expect {
          delete :destroy, params: {id: post.to_param}
        }.to change(Post, :count).by(-1)
      end

      it 'redirects to the posts list' do
        post = Post.create! valid_attributes
        delete :destroy, params: {id: post.to_param}
        expect(response).to redirect_to(admin_posts_url)
      end
    end
  end
end
