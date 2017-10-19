class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy,:add_comments]
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  def index
    if params[:title]
      @blogs = Blog.where("title like ? ","%#{params[:title]}%").page(params[:page]).per(10)
    elsif params[:category_id]
      @blogs = Blog.where(category_id:params[:category_id]).page(params[:page]).per(10)
    else
      @blogs = Blog.all.page(params[:page]).per(10)
    end
  end

  def top_search
    @blogs = Blog.where("title like '#{params[:title]}%' ").page(params[:page]).per(9)
    render "index"
  end

  def add_comments
    Comment.create(blog_id:@blog.id,content:params[:comment_text])
    render :partial => 'add_comments'
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog.update(view_count: @blog.view_count.to_i + 1)
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
        unless params[:draft_img].blank?
          attachment = Attachment.create(attachment_entity_type: "Blog",attachment_entity_id: @blog.id , path: params[:draft_img], created_by: 1 ) 
          @blog.cover_img = attachment.id
          @blog.save
        end
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
        unless params[:draft_img].blank?
          attachment = Attachment.create(attachment_entity_type: "Blog",attachment_entity_id: @blog.id , path: params[:draft_img], created_by: 1 ) 
          @blog.cover_img = attachment.id
          @blog.save
        end
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

  def upload_image
    attachment = Attachment.create(attachment_entity_type: "Blog", path: params[:wang_editor_file], created_by: 1 )
    render plain: attachment.path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:category_id,:title,:content,:cover_img)
    end
end
