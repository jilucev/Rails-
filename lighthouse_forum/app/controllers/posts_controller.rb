class PostsController < ApplicationController

  #where the actions component of our controller resides

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new #relates to the form controller in posts/new
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      author: params[:post][:author],
      text: params[:post][:text]
    )

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

protected

  def post_params
    params.require(:post).permit(:title, :author, :text)
  end


  #{params: {post: {title: [user_input], 
  #author: [user_input], text: [user_input]}}}
  #creates this hash and attempts to save it. If
  # it's successful, it redirects to posts_path
  # On failure, we'll render our new page with 
  # form posts again
end