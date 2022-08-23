class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_9a3fffc17adf4052ac921fb0e57968bc')
    if params[:ticker] == ""
      @nada = "Ehh! Has olvidado entrar la búsqueda"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote( params[:ticker] )
      rescue => e
        @stock = nil
      end
      if @stock == nil
          @error = "Ehh! Ese símbolo no existe" 
      end
    end
  end
  def nosotros
  end
end
