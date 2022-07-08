class StockTransactionsController < ApplicationController
  def new
    @stock = Stock.find_by_symbol(params[:symbol])
    @new_stock = StockTransaction.new(stock_id: @stock.id)
  end

  def index
    @transactions = current_user.stock_transactions.includes(:stock).order(created_at: :desc)
  end

  def create
    @stock_transaction = current_user.stock_transactions.new(stock_transaction_params)

    if @stock_transaction.save
      redirect_to stocks_path, notice: "You have successfully bought a stock"
    else
      render :new
    end
  end

  private

  def stock_transaction_params
    params.require(:stock_transaction).permit(:amount, :stock_id)
  end
end
