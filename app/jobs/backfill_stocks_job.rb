class BackfillStocksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    client = IEX::Api::Client.new
    client.stock_market_list(:iexvolume, {listLimit: 20000}).each do |data|
      Stock.create(
        symbol: data.symbol,
        company_name: data.company_name,
        price: data.latest_price,
        change_percent: data.change_percent_s,
        logo_url: "https://storage.googleapis.com/iex/api/logos/#{data.symbol}.png",
        chart: client.chart(data.symbol)
      )
    end
  end
end
