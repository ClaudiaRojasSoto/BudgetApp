class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[index]
  before_action :set_purchase, only: %i[edit update destroy]

  def index
    @purchases = current_user.purchases.where(category: @category).order(created_at: :desc)
  end

  def new
    @purchase = current_user.purchases.build
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)
    puts '---------'
    @purchase.created_at = Time.zone.now

    if @purchase.save
      puts @purchase.inspect
      redirect_to purchases_path(category_id: @purchase.categories.first), notice: 'Purchase was successfully created.'
    else
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
