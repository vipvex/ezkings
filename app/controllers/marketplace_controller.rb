class MarketplaceController < ApplicationController
  layout 'full_width'
  
  def index
    @cards = Card.all
    
    @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufacturers = CardManufacturer.all
    @seasons = (2010...Date.today.year).to_a.reverse
    @available_options = ["ignore", "include", "only_sold_out"]
    
    
    @search_params = {}    
    
    @cart = Cart.find_or_create_by(user_id: current_user.id) if current_user
  end

  def search
    
    @search_params = search_params
    @available_options = ["ignore", "include", "only_sold_out"]

    q = {}
    q[:card_players] = { player_id: search_params[:player_ids] } if search_params[:player_ids]
    q[:card_teams] = { team_id: search_params[:team_ids] } if search_params[:team_ids]
    q[:card_manufacturer_cards] = { card_manufacturer_id: search_params[:card_manufacturer_ids] } if search_params[:card_manufacturer_ids]
    q[:year] = search_params[:seasons] if search_params[:seasons]
    
    q[:available] = (1..100).to_a if search_params[:available_options] == "ignore"
    q[:available] = 0 if search_params[:available_options] == "only_sold_out"

    price_min = search_params[:price_min] != "" ? search_params[:price_min].to_i : 0
    price_max = search_params[:price_max] != "" ? search_params[:price_max].to_i : 100000
    puts "\n#{price_min}\n"
    puts "\n#{price_max}\n"
    q[:price] = price_min..price_max

    puts "\n#{search_params[:available_options]}\n"

    @cards = Card.joins(:card_players, :card_teams, :card_manufacturer_cards).where(q).uniq
          
    puts "\nCard count: #{@cards.count}\n"
          
    if search_params[:attribute_ids]
      card_ids = CardAttribute.where(attribute_id: search_params[:attribute_ids]).pluck(:card_id)
      card_ids = card_ids.select{ |e| card_ids.count(e) >= search_params[:attribute_ids].count }.uniq
      
      puts "\n#{card_ids.count}\n"
      
      #@cards = Card.all if @cards.empty?
      
      @cards = @cards.where(id: card_ids)
      
    end

    puts "\nCard count: #{@cards.count}\n"

                            
    @attributes = Attribute.all
    @players = search_params[:player_ids] ? Player.where(id: search_params[:player_ids][0]) : Player.all
    @teams = search_params[:team_ids] ? Team.where(id: search_params[:team_ids][0]) : Team.all
    @card_manufacturers = search_params[:card_manufacturer_ids] ? CardManufacturer.where(id: search_params[:card_manufacturer_ids][0]) : CardManufacturer.all
    @seasons = search_params[:seasons] ? [search_params[:seasons][0].to_i] : (2010...Date.today.year).to_a.reverse
    @sold = ["Ignore", "Include", "Only Sold Out"]

                                       
    @cards = Card.all if @cards.empty?
    
    respond_to do |format|
      format.html { render 'index', notice: "Found #{@cards.count} cards" }
    end
  end
  
  private
    def search_params
      params.fetch(:search, {}).permit(:available_options, :price_min, :price_max, :sort, :listing, :view, :player_ids => [], :team_ids => [], :card_manufacturer_ids => [], :attribute_ids => [], :seasons => [])
    end
end
