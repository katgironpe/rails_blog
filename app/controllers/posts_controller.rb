class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order('created_at DESC')
  end

  def show
  end

  private
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
