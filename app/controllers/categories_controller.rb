# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = current_user.groups # Cambiado a groups
  end

  def new
    @category = current_user.groups.build # Cambiado a groups
  end

  def create
    @category = current_user.groups.build(category_params) # Cambiado a groups
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Group.find(params[:id]) # Cambiado a Group
  end

  def category_params
    params.require(:group).permit(:name, :icon) # Cambiado a group
  end
end
