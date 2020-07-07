class BlogsController < ApplicationController
  #include Pagy::Backend
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  access all: %i[show index], user: { except: %i[destroy new create update edit] }, site_admin: :all
  # use the blog layout
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all_blogs
    #@blogs = Blog.page(params.permit.to_h[:page]).per(5)
    #@pagy, @blogs = pagy(Blog.all, page: params[:page], items: 5)
    # Puts debuggging example ##
    # puts "*" * 500
    # puts @blog.inspect
    # puts "*" * 500
    ############################
    # Using byebug - insert in the KEY area that needs debugging!!!
    #byebug
    @page_title = "My Portfolio Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status

    if @blog.Draft?
      @blog.Published!
    elsif @blog.Published?
      @blog.Draft!
    end

    respond_to do |format|
      format.html{ redirect_to blogs_url, status: 'Post has been updated' }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end


end
