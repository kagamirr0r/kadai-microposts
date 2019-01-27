class LikesController < ApplicationController
before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'ユーザをフォローしました。'
    #redirect_to root_url
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.cancel_favorite(micropost)
    flash[:success] = 'ユーザのフォローを解除しました。'
    #redirect_to root_url
    redirect_back(fallback_location: root_url)

  end

end
