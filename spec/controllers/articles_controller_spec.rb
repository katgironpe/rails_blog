require 'rails_helper'

describe ArticlesController do

  let(:valid_attributes) { attributes_for(:article) }

  describe '#index' do
    it 'assigns all articles as @articles' do
      article = Article.create! valid_attributes
      get :index
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe '#show' do
    it 'assigns the requested article as @article' do
      article = Article.create! valid_attributes
      get :show, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
      expect(assigns(:title)).to eq(article.title)
    end
  end
end
