class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def index
    if params.has_key?(:user_id) && !params.has_key?(:artwork_id)
      comments = Comment.where(author_id: params[:user_id])
      render json: comments
      return
    elsif params.has_key?(:artwork_id)
      comments = Comment.where(artwork_id: params[:artwork_id])
      render json: comments
      return
    end
    comment = Comment.all
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comments).permit(:body, :author_id, :artwork_id)
  end
end