class CardManufacturerCardsController < ApplicationController
  before_action :set_card_manufacturer_card, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /card_manufacturer_cards
  # GET /card_manufacturer_cards.json
  def index
    @card_manufacturer_cards = CardManufacturerCard.all
  end

  # GET /card_manufacturer_cards/1
  # GET /card_manufacturer_cards/1.json
  def show
  end

  # GET /card_manufacturer_cards/new
  def new
    @card_manufacturer_card = CardManufacturerCard.new
  end

  # GET /card_manufacturer_cards/1/edit
  def edit
  end

  # POST /card_manufacturer_cards
  # POST /card_manufacturer_cards.json
  def create
    @card_manufacturer_card = CardManufacturerCard.new(card_manufacturer_card_params)

    respond_to do |format|
      if @card_manufacturer_card.save
        format.html { redirect_to @card_manufacturer_card, notice: 'Card manufacturer card was successfully created.' }
        format.json { render :show, status: :created, location: @card_manufacturer_card }
      else
        format.html { render :new }
        format.json { render json: @card_manufacturer_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_manufacturer_cards/1
  # PATCH/PUT /card_manufacturer_cards/1.json
  def update
    respond_to do |format|
      if @card_manufacturer_card.update(card_manufacturer_card_params)
        format.html { redirect_to @card_manufacturer_card, notice: 'Card manufacturer card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_manufacturer_card }
      else
        format.html { render :edit }
        format.json { render json: @card_manufacturer_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_manufacturer_cards/1
  # DELETE /card_manufacturer_cards/1.json
  def destroy
    @card_manufacturer_card.destroy
    respond_to do |format|
      format.html { redirect_to card_manufacturer_cards_url, notice: 'Card manufacturer card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_manufacturer_card
      @card_manufacturer_card = CardManufacturerCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_manufacturer_card_params
      params.require(:card_manufacturer_card).permit(:card_id, :card_manufacturer_id)
    end
end
