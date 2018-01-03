class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def edit
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
    #@user.tasks.destroy_all
    @user.destroy
    flash[:notice] = "ユーザーが削除されました"
    redirect_to admin_users_path
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password)
   end
end
