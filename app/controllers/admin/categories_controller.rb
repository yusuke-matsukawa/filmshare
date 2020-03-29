class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all #カテゴリを全て格納
    @category = Category.new #新規作成用。空のモデル
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all
    if @category.save
       redirect_to admin_categories_path
    else
       render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       redirect_to admin_categories_path
    else
       render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.delete
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
