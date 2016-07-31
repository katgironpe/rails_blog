class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.order('created_at DESC').page(params[:page])
  end

  def show
    @title = @article.title
  end

  private
  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
