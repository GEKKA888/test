class AdminController < ApplicationController
  def forbid_normal_user
    if @current_user.user_type == "normal"
      flash[:notice] = "管理者権限がありません"
      redirect_to posts_path
    end
  end
end
