class MarketplaceController < ApplicationController
  layout 'full_width'
  
  def index
    @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufacturers = CardManufacturer.all

    set_vars
    
    @cards = Card.all
    @view_cards = @cards.paginate(:page => params[:page], :per_page => search_params[:per_page_options] || @page_options[@default_page_option])
  end

  def search

    set_vars
    
    # Setup query for cards
    q = {}
    
    q[:card_players] = { player_id: search_params[:player_ids] } if search_params[:player_ids]
    
    q[:card_teams] = { team_id: search_params[:team_ids] } if search_params[:team_ids]
    
    q[:card_manufacturer_cards] = { card_manufacturer_id: search_params[:card_manufacturer_ids] } if search_params[:card_manufacturer_ids]
    
    q[:year] = search_params[:seasons] if search_params[:seasons]
    
    q[:available] = (1..100).to_a if search_params[:available_options] == "ignore"
    q[:available] = 0 if search_params[:available_options] == "only_sold_out"

    price_min = search_params[:price_min] != "" ? search_params[:price_min].to_i : 0
    price_max = search_params[:price_max] != "" ? search_params[:price_max].to_i : 100000

    q[:price] = price_min..price_max


    @cards = Card.joins(:card_players, :card_teams, :card_manufacturer_cards).where(q).uniq

    # Search for attributes seperately
    if search_params[:attribute_ids]
      card_ids = CardAttribute.where(attribute_id: search_params[:attribute_ids]).pluck(:card_id)
      card_ids = card_ids.select{ |e| card_ids.count(e) >= search_params[:attribute_ids].count }.uniq
      
      @cards = @cards.where(id: card_ids)
      
    end


                            
   @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufacturers = CardManufacturer.all
                                       
    @cards = Card.all if @cards.empty?
    
    @cards = @cards.order(price: :ASC) if search_params[:sort_options] == "price_low_to_high"
    @cards = @cards.order(price: :DESC) if search_params[:sort_options] == "price_high_to_low"
    @cards = @cards.order(year: :ASC) if search_params[:sort_options] == "oldest_to_newest"
    @cards = @cards.order(year: :DESC) if search_params[:sort_options] == "newest_to_oldest"
    
    @view_cards = @cards.paginate(:page => params[:page], :per_page => search_params[:per_page_options] || @page_options[@default_page_option])


    respond_to do |format|
      format.html { render 'index', notice: "Found #{@cards.count} cards" }
    end
  end
  
  private
  
    def set_vars
      @search_params = search_params

      @available_options = ["ignore", "include", "only_sold_out"]
      
      @sort_options = [["Price: Low to High", "price_low_to_high"],
                       ["Price: High to Low", "price_high_to_low"],
                       ["Newest To Oldest",   "newest_to_oldest"],
                       ["Oldest to Newest",   "oldest_to_newest"]]
                       
      @view_options = ["list", "thumb", "text", "details"]
      @default_view_option = 0

      @page_options = [10, 25, 50, 100, 200]

      # Index of page options
      @default_page_option = 2 

      @seasons = (2010...Date.today.year).to_a.reverse
      
      @search_params[:view_options] = @view_options[@default_view_option] if search_params[:view_options].nil?
    end
  
    def search_params
      params.fetch(:search, {}).permit(:per_page_options, :view_options, :available_options, :price_min, :price_max, :sort_options, :listing, :view, :player_ids => [], :team_ids => [], :card_manufacturer_ids => [], :attribute_ids => [], :seasons => [])
    end
end
