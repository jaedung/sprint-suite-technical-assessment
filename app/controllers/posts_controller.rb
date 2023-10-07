class PostsController < ApplicationController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(posted_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @post.update(post_update_params)
    redirect_to post_path(@post)
  end

  def destroy
  end

  def search
    @posts = PostSearchService.new(post_search_params).run
    @posts = @posts.order(posted_at: :desc).page(params[:page])

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

  def post_update_params
    params.require(:post).permit(:content, :source, :posted_at)
  end

  def load_post
    @post = Post.find(params[:id])
  end
end
