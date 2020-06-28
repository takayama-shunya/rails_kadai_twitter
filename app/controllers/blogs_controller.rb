class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :list_blogs, only: [:edit_or_destroy, :index]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ツイートしました！"
      else
        render :new
      end
    end
  end

  def index
  end

  def edit_or_destroy
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
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def list_blogs
    @blogs = Blog.all.order(created_at: :desc)
  end

end
