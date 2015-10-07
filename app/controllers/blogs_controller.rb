class BlogsController <ApplicationController

  def index
    @blogs = Blog.all
  end

  def show

    @blog = Blog.find(params[:id])

  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = User.find(2)

    if @blog.save

      flash[:success] = 'Your blog was  created successfully'
      redirect_to blogs_path


    else
      render :new
    end

  end

  def edit

    @blog = Blog.find(params[:id])

  end

  def update

    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:success] = 'Your blog was updated successfully'
      redirect_to blog_path(@blog)


    else
      render :edit

    end


  end

  private

  def blog_params
    params.require(:blog).permit(:blogname,:description)
  end


end