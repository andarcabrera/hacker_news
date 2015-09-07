class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = session_user.posts.new(post_params)
    if @post.save
      redirect_to "/"
    else
      render "posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
        @post = Post.find(params[:id])
        @post.update_attributes(post_params)
        if @post.valid?
          redirect_to "/"
        else
          render "posts/edit"
        end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end

  def post_params
    params.require(:post).permit(:title, :body, :id)
  end
end
