# app/controllers/transactions_controller.rb
class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[edit update destroy]

  def index
    @transactions = current_user.entities # Cambiado a entities
  end

  def new
    @transaction = Entity.new # Cambiado a Entity
  end

  def create
    @transaction = Entity.new(transaction_params) # Cambiado a Entity
    if @transaction.save
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = Entity.find(params[:id]) # Cambiado a Entity
  end

  def transaction_params
    params.require(:entity).permit(:name, :amount, :group_id) # Cambiado a entity y group_id
  end
end
