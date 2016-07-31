class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  respond_to :json

  def index
    @comments = Comment.where(params[:post_id]).order('created_at DESC').page(params[:page])
    respond_with @comments
  end

  def show
    respond_with @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_with(@comment)
    else
      respond_with(@comment.errors, status: :unprocessable_entity)
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :user_name, :body)
  end
end
