class MarketplaceController < ApplicationController
  layout 'full_width'
  
  def index
    @cards = Card.all
    
    @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufactureres = CardManufacturer.all
    
    
    if current_user
      @cart = Cart.find_or_create_by(user_id: current_user.id)
      #@card = Card.all.sample
      #@cart.add(@card, @card.price, 1)
    end
  end

  def search
    @cards = Card.joins(:players, :c_attributes, :teams, :card_manufactureres).where()
  end
  
  private
    def search_params
      params.require(:search).permit(:attribute_ids, :player_ids, :team_ids, :card_manufactureres_ids)
    end
end
