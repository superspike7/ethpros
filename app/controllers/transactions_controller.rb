class TransactionsController < ApplicationController
  def new
    @stock = Stock.find_by_symbol(params[:symbol])
    @new_stock = Transaction.new(stock_id: @stock.id)
  end

  def index
    @transactions = current_user.transactions.includes(:stock).order(created_at: :desc)
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to stocks_path, notice: "your transaction is successful"
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :stock_id)
  end
end
