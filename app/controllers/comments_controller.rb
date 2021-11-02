class CommentsController < ApplicationController
  def create
    post_id = params[:id]
    new_comment = Comment.create(user_id: current_user.id, post_id: post_id, text: comment_params[:text])
    new_comment.update_post_comments_counter
    if new_comment.save
      redirect_to user_post_path(current_user.id, post_id), notice: 'Comment created!'
    else
      flash.now[:error] = 'Unable to create comment!'
      redirect_to user_post_path(current_user.id, post_id), alert: 'Failed to add comment!'
    end
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
