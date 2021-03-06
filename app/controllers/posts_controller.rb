class PostsController < ApplicationController
before_action :authenticate_user
before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
helper_method :sort_column, :sort_direction

  def index
    #@posts = Task.all.order(created_at: :desc)
    #@posts = Task.all.order(sort_column + ' ' + sort_direction)
    search
    @posts = @posts.page(params[:page]).per(6).includes(:user).order(sort_column + ' ' + sort_direction)
    #@posts = Task.page(params[:page]).per(6).all.includes(:user).order(sort_column + ' ' + sort_direction)
    @labels = @current_user.labels
  end

  def show
    @post = Task.find_by(id:params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Task.new
  end

  def create
    @post = Task.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash[:notice] = "タスクを登録しました"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def edit
    @post = Task.find_by(id:params[:id])
  end

  def update
    @post = Task.find_by(id:params[:id])
    @post.update_attributes(post_params)

    if @post.save
      flash[:notice] = "タスクを編集しました"
      redirect_to posts_path
    else
      render ("edit")
    end
  end

  def destroy
    @post = Task.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to posts_path
  end

  def ensure_correct_user
    @post = Task.find_by(id: params[:id])
    if !@current_user.tasks.find(params[:id])
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  private

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def post_params
      params.require(:task).permit(:title, :content, :deadline, :status, :priority)
    end

    def search
      status = params[:status]
      word = params[:word]
      label = params[:label]

      #@posts = Task.all
      @posts = @current_user.tasks

      unless status.blank?
        @posts = @posts.where(status: status)
      end

      unless word.blank?
        @posts = @posts.search(word)
      end

      unless label.blank?
        @posts = @posts.joins(:labels).where(labels: {name: label})
      end
    end
end
