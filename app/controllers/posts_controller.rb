class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order('created_at DESC').page(params[:page])
  end

  def show
    @title = @post.title
  end

  private
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
