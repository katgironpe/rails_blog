require 'rails_helper'

describe Admin::ArticlesController do

  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:article).merge(user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:article, title: '', body: '') }

  describe '#index' do
    it_behaves_like 'a restricted index page action'

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns all articles as @articles' do
        article = Article.create! valid_attributes
        get :index
        expect(assigns(:articles)).to eq([article])
      end
    end
  end

  describe '#show' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        article = Article.create! valid_attributes
        get :show, params: { id: article.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns the requested article as @article' do
        article = Article.create! valid_attributes
        get :show, params: { id: article.to_param }
        expect(assigns(:article)).to eq(article)
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

      it 'assigns a new article as @article' do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
      end
    end
  end

  describe '#edit' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        article = Article.create! valid_attributes
        get :edit, params: {id: article.to_param}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'assigns the requested article as @article' do
        article = Article.create! valid_attributes
        get :edit, params: {id: article.to_param}
        expect(assigns(:article)).to eq(article)
      end
    end
  end

  describe '#create' do
    context 'with valid params' do
      before { sign_in_user }

      it 'creates a new Article' do
        expect {
          post :create, params: {article: valid_attributes}
        }.to change(Article, :count).by(1)
      end

      it 'assigns a newly created article as @article' do
        post :create, params: {article: valid_attributes}
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it 'redirects to the created article' do
        post :create, params: {article: valid_attributes}
        expect(response).to redirect_to(admin_article_path(Article.last))
      end
    end

    context 'with invalid params' do
      before { sign_in_user }

      it 'assigns a newly created but unsaved article as @article' do
        post :create, params: {article: invalid_attributes}
        expect(assigns(:article)).to be_a_new(Article)
      end

      it 're-renders the new template' do
        post :create, params: {article: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe '#update' do
    let(:new_attributes) { { title: 'Test' }}

    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: new_attributes}
        article.reload
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with valid params' do
      before { sign_in_user }

      it 'updates the requested article' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: new_attributes}
        article.reload
        expect(response).to redirect_to(admin_article_path(article))
      end

      it 'assigns the requested article as @article' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}
        expect(assigns(:article)).to eq(article)
      end

      it 'redirects to the article' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}
        expect(response).to redirect_to(admin_article_path(article))
      end
    end

    context 'with invalid params' do
      before { sign_in_user }

      it 'assigns the article as @article' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: invalid_attributes}
        expect(assigns(:article)).to eq(article)
      end

      it 're-renders the edit template' do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe '#destroy' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        article = Article.create! valid_attributes
        delete :destroy, params: {id: article.to_param}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before { sign_in_user }

      it 'destroys the requested article' do
        article = Article.create! valid_attributes
        expect {
          delete :destroy, params: {id: article.to_param}
        }.to change(Article, :count).by(-1)
      end

      it 'redirects to the articles list' do
        article = Article.create! valid_attributes
        delete :destroy, params: {id: article.to_param}
        expect(response).to redirect_to(admin_articles_url)
      end
    end
  end
end
