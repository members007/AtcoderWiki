class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "posted successfully"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end    
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "updated successfully"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "deleted successfully"
      redirect_to("/posts/index")
    else
      render("posts/show")
    end
  end
end
