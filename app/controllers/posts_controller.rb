class PostsController < ApplicationController
helper_method :sort_column, :sort_direction

  def index
    #@posts = Task.all.order(created_at: :desc)
    @posts = Task.all.order(sort_column + ' ' + sort_direction)
  end

  def show
    @post = Task.find_by(id:params[:id])
  end

  def new
    @post = Task.new
  end

  def create
    @post = Task.new(title:params[:title],content:params[:content],deadline:params[:deadline],status:params[:status])
    if @post.save
      flash[:notice] = "タスクを登録しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Task.find_by(id:params[:id])
  end

  def update
    @post = Task.find_by(id:params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.deadline = params[:deadline]
    if @post.save
      flash[:notice] = "タスクを編集しました"
      redirect_to("/")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Task.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/")
  end

  private

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    def sort_column
        Task.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
end
