class LikesController < ApplicationController
before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorites(micropost)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to user
  end
  
  def destory
    micropost = Micropost.find(params[:micropost_id])
    current_user.cancel_favorite(micropost)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to user  
  end

end
