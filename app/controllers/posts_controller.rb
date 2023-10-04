class PostsController < ApplicationController
  def index
    @posts = Post.order(posted_at: :asc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = PostSearchService.new(post_search_params).run
    @posts = @posts.order(posted_at: :asc).page(params[:page])

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
        :list
      )
  end
end
