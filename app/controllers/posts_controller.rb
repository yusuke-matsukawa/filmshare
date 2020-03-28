class PostsController < ApplicationController
  def index
    @posts = Post.all
    @genre_posts = GenrePost.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save!
      params[:genre_ids].each do |genre_id|
        if genre_id != ""
          genre_post = post.genre_posts.new(genre_id: genre_id)
          genre_post.save
        end
      end
    end
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    if @post.genre_posts.count == 1
      @post.genre_posts.build
      @post.genre_posts.build
    elsif @post.genre_posts.count == 2
      @post.genre_posts.build
    end
  end

  def update
    post = Post.find(params[:id])
    pp = post_params #変数に入れる
    if pp[:genre_posts_attributes]["1"][:genre_id] == ""
      pp[:genre_posts_attributes].delete("1")
    elsif pp[:genre_posts_attributes]["2"][:genre_id] == ""
      pp[:genre_posts_attributes].delete("2")
    end
    post.genre_posts.destroy_all
    post.update(pp)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :opinion, :category_id, genre_posts_attributes:[:genre_id])
  end

end
