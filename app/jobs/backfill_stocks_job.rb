class BackfillStocksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    client = IEX::Api::Client.new
    client.stock_market_list(:iexvolume, {listLimit: 20000}).each do |data|
      Stock.create(data)
    end
  end
end
