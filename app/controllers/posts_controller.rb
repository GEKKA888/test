class PostsController < ApplicationController
  def index
    @posts = Task.all.order(created_at: :desc)
  end

  def show
    @post = Task.find_by(id:params[:id])
  end

  def new
  end

  def create
    @post = Task.new(title:params[:title],content:params[:content])
    @post.save
    redirect_to("/")
  end

end
