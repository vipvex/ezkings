class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
        
    @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufacturers = CardManufacturer.all
  end

  # GET /cards/1/edit
  def edit
    @attributes = Attribute.all
    @players = Player.all
    @teams = Team.all
    @card_manufacturers = CardManufacturer.all
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    
    if params[:file].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:file])         
      raise "Invalid upload signature" if !preloaded.valid?
      @card.front_image_url = preloaded.identifier
    end

    respond_to do |format|
      if @card.save
        
        #@card.card_players.create(card_params[:player_ids].collect { |id| { card_id: @card.id, player_id: id.to_i } } )

        
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    if params[:image_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
      raise "Invalid upload signature" if !preloaded.valid?
      @model.image_id = preloaded.identifier
    end
    
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to cards_path, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :year, :description, :sku, :price, :serial_number, :front_image_url, :available, :back_image_url, :team_ids => [], :c_attribute_ids => [], :card_manufacturer_ids => [], :player_ids => [])
    end
end
