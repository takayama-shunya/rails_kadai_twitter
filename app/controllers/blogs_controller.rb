class BlogsController < ApplicationController
  
  def new
    @blog = Blog.new
  end

  def create
  end

  def index
    @blogs = Blog.all
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
