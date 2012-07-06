class PictController < ApplicationController
  def show
    @pic = Pict.find(params[:id])
    @comment = Comment.new()
    @comments = Comment.find_all_by_pict_id(@pic.id)
  end

  def like
    @like = Like.new()
    @like.user_id = current_user.id
    @like.pict_id = params[:pic]
    @like.pict.update_attribute :like_count, @like.pict.like_count.to_i + 1
    @like.save
    redirect_to :back
  end

  def comment
    @comment = Comment.new()
    @comment.user_id = current_user.id
    @comment.pict_id = params[:comment][:pic]
    @comment.content = params[:comment][:content]
    @comment.save
    redirect_to :back
  end

  def all
    @pic = Pict.all
  end

end