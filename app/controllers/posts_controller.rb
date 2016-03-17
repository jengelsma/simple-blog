class PostsController < ApplicationController
  before_action :set_statuses
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :all_posts, only:[:index, :create, :destroy, :update]

  respond_to :html, :js

  def all_posts
    @posts = Post.all
  end

  # GET /posts
  # GET /posts.json
  def index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    author = Author.find(post_params[:author_id])
    @post.build_author(:id  => author.id) 
    @post.save!
    @current_post = @post
  end

  # def create
  #   @post = Post.new(post_params)

  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to @post, notice: 'Post was successfully created.' }
  #       format.json { render :show, status: :created, location: @post }
  #       author = Author.find(post_params[:author_id])
  #       @post.build_author(:id  => author.id)
  #     else
  #       format.html { render :new }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.update!(post_params)
  end

  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy!
  end

  # def destroy
  #   @post.destroy
  #   respond_to do |format|
  #     format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_statuses
        @statuses = Post.statuses
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :article, :likes, :status, :author_id)
    end
end
