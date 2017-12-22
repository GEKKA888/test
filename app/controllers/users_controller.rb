class UsersController < ApplicationController
  def login_form
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email])
    if @user.save
      flash[:notice] = "ユーザーが登録されました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "ユーザーが更新されました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

end
