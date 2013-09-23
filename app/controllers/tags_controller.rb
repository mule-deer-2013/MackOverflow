class TagsController < ApplicationController

  def index
    def index
    @tags = Tags.all
  end
  end

  def show
    @tag = Tag.find(params[:id])
  end

end
