class TransactionsController < ApplicationController
  def new
    @stock = Stock.find_by_symbol(params[:symbol]) 
    @transaction_type = params[:transaction_type]
    
    @transaction = Transaction.new
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
    params.require(:transaction).permit(:amount, :stock_id, :transaction_type)
  end
end
