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
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :opinion, :category_id)
  end
end
