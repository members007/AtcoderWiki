class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], bio: params[:bio], AtCoder: params[:AtCoder], CodeForces: params[:CodeForces])
    if @user.save
      flash[:notice] = "your account created successfully"
      redirect_to("/users/index")
    else
      render("users/new")
    end     
  end
end
