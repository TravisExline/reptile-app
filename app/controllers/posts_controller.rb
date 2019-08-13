class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if !params[:date].blank?
      if params[:date] == "Today"
        @posts = Post.from_today
      else @posts = Post.older
      end
    else
      if params[:user_id]
        @posts = Post.find(params[:user_id]).posts
      else
        @posts = Post.all
      end
    end
  end

  def new
    @post = Post.new
    @reptiles = current_user.reptiles
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :reptile_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
