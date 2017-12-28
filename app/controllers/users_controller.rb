class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new,:create]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザーが登録されました"
      redirect_to user_path(@user)
      #redirect_to("/users/#{@user.id}")
    else
      render new_user_path
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
      redirect_to user_path(@user)
    else
      render("edit")
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end
end
