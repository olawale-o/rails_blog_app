class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    new_like = Like.create(user_id: current_user.id, post_id: post.id)
    new_like.update_post_likes_counter
    if new_like.save
      redirect_to user_post_path(post.user.id, post.id), notice: 'Liked'
    else
      redirect_to user_post_path(post.user.id, post.id), alert: 'Not liked!'
    end
  end
end