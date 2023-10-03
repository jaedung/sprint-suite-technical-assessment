class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(Post::POST_PER_PAGE)
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = PostSearchService.new(params).run
    render 'index'
  end
end
