class BlogsController < ApplicationController
  def top

	end	
  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def create
  	@blog = Blog.new(blog_params)
    @blogs =Blog.all
   if @blog.save
      flash[:success] = "successfully"
      redirect_to blogs_path
    else
      flash.now[:danger] = "error"
      render 'index'
     end
 end

   def edit
  	@blog = Blog.find(params[:id])
  	
end
  
  def update
  @blog = Blog.find(params[:id])
  if @blog.update(blog_params)
  flash[:success] = "successfully"
  redirect_to blogs_path
   end
 end
  
  
  def destroy
	@blog = Blog.find(params[:id])
		if @blog.destroy
      flash[:success] = "successfully"
      redirect_to blogs_path
  end
end
 
private
   def blog_params
	params.require(:blog).permit(:title,:body)
   end
end