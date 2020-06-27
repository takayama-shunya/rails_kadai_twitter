class BlogsController < ApplicationController
  before_action :set_bolg, only: [:edit, :update, :destroy]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ツイートしました！"
    else
      render :new
    end
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました"
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_bolg
    @blog = Blog.find(params[:id])
  end

end
