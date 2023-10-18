class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[index]
  before_action :set_purchase, only: %i[edit update destroy]

  def index
    @purchases = current_user.purchases.where(category: @category).includes(:categories).order(created_at: :desc)
  end  

  def new
    @purchase = current_user.purchases.build
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)
    @purchase.created_at = Time.zone.now

    if @purchase.category_ids.empty?
      flash.now[:alert] = 'Please select at least one category.'
      @categories = current_user.categories
      render :new
    elsif @purchase.save
      flash[:notice] = 'Purchase was successfully created.'
      redirect_to purchases_path(category_id: @purchase.categories.first)
    else
      flash.now[:alert] = 'Failed to create purchase.'
      @categories = current_user.categories
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_purchase
    @purchase = current_user.purchases.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end
