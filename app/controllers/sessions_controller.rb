class SessionsController < ApplicationController
  before_action :forbid_login_user, {only: [:new,:create]}

  def new
  end

  def index
  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      #redirect_to("/posts")
      redirect_to posts_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      #render("users/login_form")
      render new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    #redirect_to("/login")
    redirect_to new_session_path
  end
end
