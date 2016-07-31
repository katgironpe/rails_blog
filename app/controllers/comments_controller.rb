class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  respond_to :json

  def index
    if params[:post_id]
      @comments = Comment.where(commentable_id: params[:post_id]).order('created_at DESC').page(params[:page])
    else
      @comments = Comment.order('created_at DESC').page(params[:page])
    end

     respond_with  comments: @comments, pagination: {
      current_page: @comments.current_page,
      next_page: @comments.next_page,
      prev_page: @comments.prev_page,
      total_pages: @comments.total_pages,
      total_count: @comments.total_count
    }
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
