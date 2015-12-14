class TagsController < ApplicationController

  def index
    @tags = Tag.order(questions_count: :desc).limit(15)
    if params[:search]
      search_tag = Tag.search(params[:search])
      if search_tag.count == 0
        @errors = ["There are no questions for the tag: #{params[:search]}"]
        render :index
      else
        tag_id = search_tag.first.id
        redirect_to tag_path(tag_id)
      end
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

end
