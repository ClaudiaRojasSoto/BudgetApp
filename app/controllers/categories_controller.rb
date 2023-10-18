class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[edit update destroy]
  before_action :ensure_user_owns_category, only: %i[edit update destroy]

  def index
    @categories = current_user.categories
    # @total_purchases = current_user.purchases.pluck(:amount).sum
    # @total_purchases = current_user.purchases.joins(:categories).pluck(:amount).sum
    @total_purchases = current_user.purchases.includes(:categories).pluck(:amount).sum
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      @categories = current_user.categories
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def ensure_user_owns_category
    return if current_user == @category.user

    redirect_to categories_path, alert: 'You are not authorized to perform this action.'
  end
end
