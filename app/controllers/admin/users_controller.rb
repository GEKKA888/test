class Admin::UsersController < AdminController
  before_action :authenticate_user
  before_action :forbid_normal_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザーが登録されました"
      redirect_to admin_users_path
    else
      render new_admin_user_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:notice] = "ユーザーが更新されました"
      redirect_to admin_users_path
    else
      render("edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user != @current_user
      @user.destroy
      flash[:notice] = "ユーザーが削除されました"
      redirect_to admin_users_path
    else
      flash[:notice] = "このユーザーは削除できません"
      redirect_to admin_users_path
    end
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :user_type)
   end
end
