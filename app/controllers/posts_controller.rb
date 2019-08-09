class PostsController < ApplicationController
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
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.user_id = @user.id
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
