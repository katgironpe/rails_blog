class TagsController < ApplicationController
  def index
    @tag = Tag.filter_by_name(params[:name])
    resource = params[:resource_type].capitalize
    @title = %(#{resource} with tag "#{params[:name]}")
    @posts = @tag.taggings.map { |tag| tag.resource }
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end
end
