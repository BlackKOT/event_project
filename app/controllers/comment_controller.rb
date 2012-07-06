class CommentController < ApplicationController
  def all
    @all_comments = Comment.all
  end
end
