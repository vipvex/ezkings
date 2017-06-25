class MarketplaceController < ApplicationController
  layout 'full_width'
  
  def index
    @cards = Card.all
  end

  def search
  end
end
