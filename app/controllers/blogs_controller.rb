class BlogsController < ApplicationController
  
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
    @blogs = Blog.all
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
