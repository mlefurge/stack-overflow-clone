class TagsController < ApplicationController

  def index
    @tags = Tags.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
  end

  def create
  end


end
