class LabelsController < ApplicationController
  def new
    @labels = @current_user.labels
    @label = Label.new
    @task_id = params[:task_id]
  end

  def edit
    @labels = @current_user.labels
    @label = Label.find_by(id: params[:id])
    @task_id = params[:task_id]
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = "ラベルが登録されました"
      redirect_to posts_path
    else
      render new_label_path
    end
  end

  def update
    @label = Label.find_by(id: params[:id])
    @label.update_attributes(label_params)
    if @label.save
      flash[:notice] = "ラベルが更新されました"
      redirect_to posts_path
    else
      render("edit")
    end
  end

  def destroy
    @label = Label.find_by(id: params[:id])
    @label.destroy
    flash[:notice] = "ラベルが削除されました"
    redirect_to posts_path
  end

  private

   def label_params
     params.require(:label).permit(:name, :user_id, :task_id)
   end
end
