class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if can? :write, :posts
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      redirect_to root_path, notice: "Post created successfully!"
    else
      flash[:error] = "You need to provide valid attributes!"
      render :new
    end
  end
end
