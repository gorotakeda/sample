class TestBlogsController < ApplicationController
  before_action :test_blog_set, only: [:show, :edit, :update, :destroy ]
  def index
    @test_blogs = TestBlog.all
  end

  def new
    @test_blog = TestBlog.new
  end

  def create
    @test_blog = TestBlog.new(test_blog_params)
   if @test_blog.save
     redirect_to test_blogs_path, notice: "Blog was successfully created"
   elsif 
     render :new
   end
  end

  def show
    
  end

  def edit
   
  end

  def update
   
   if @test_blog.update(test_blog_params)
     redirect_to test_blog_path(@test_blog), notice: "Blog was successfully updated" 
   elsif 
     render :edit
   end
  end

  def destroy
    
    if @test_blog.destroy
      redirect_to test_blogs_path, notice: "Blog was successfully destroied" 
    end
  end
  private

  def test_blog_set
    @test_blog = TestBlog.find(params[:id])
  end
  
  def test_blog_params
    params.require(:test_blog).permit(:title, :body)
  end
end
