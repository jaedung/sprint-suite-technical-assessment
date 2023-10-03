class PostsController < ApplicationController
  def index
    if params[:query].present?
      @posts = PostSearchService.new(post_search_params).run
    else
      @posts = Post.page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = PostSearchService.new(post_search_params).run
    # render 'index'

    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  private

  def post_search_params
    params
      .require(:query)
      .permit(
        :start_date,
        :end_date,
        :social_media_type,
        :custom_list,
        :table,
        :page
      )
  end
end
