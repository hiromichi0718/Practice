class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # app/controllers/posts_controller.rb
  def destroy
    puts "Params: #{params.inspect}"  # デバッグ用
    @post = Post.find_by(id: params[:id])
    puts "Post: #{@post.inspect}"  # デバッグ用

    if @post
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:alert] = 'Post not found.'
      redirect_to posts_url
    end
  end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

