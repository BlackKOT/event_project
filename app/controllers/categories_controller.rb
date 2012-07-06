class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  require "will_paginate/array"

  def index
    @categories_all = Categories.all
  end
  def show
    #@current_categ = Categories.find_by_name(params[:name]).picts.paginate(params[:page])
    @current_categ = Categories.find_by_name(params[:name])
    @pictures = @current_categ.picts.paginate(:page => params[:page], :per_page => 5)
  end

end
