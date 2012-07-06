class EventsController < ApplicationController
  def index
    @users = User.all
  end

  def like
    @like_for_user = Like.find_all_by_user_id(params[:id])
  end

  def comment
    @pict_with_comment = Pict.includes(:comments).where("comments.user_id = ?", params[:id]).order('comments.pict_id')
  end

  def sign
    if params[:login]=="1"
      @first_sign = User.find(params[:id]).created_at
    end
    @sign = SignTime.find_all_by_user_id_and_login(params[:id], params[:login])
  end

  def navigation
    @stat_for_user = PageRequest.find_all_by_user_id(params[:id])
  end

end
