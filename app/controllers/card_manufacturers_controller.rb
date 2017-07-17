class CardManufacturersController < ApplicationController
  before_action :set_card_manufacturer, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /card_manufacturers
  # GET /card_manufacturers.json
  def index
    @card_manufacturers = CardManufacturer.all
  end

  # GET /card_manufacturers/1
  # GET /card_manufacturers/1.json
  def show
  end

  # GET /card_manufacturers/new
  def new
    @card_manufacturer = CardManufacturer.new
  end

  # GET /card_manufacturers/1/edit
  def edit
  end

  # POST /card_manufacturers
  # POST /card_manufacturers.json
  def create
    @card_manufacturer = CardManufacturer.new(card_manufacturer_params)

    respond_to do |format|
      if @card_manufacturer.save
        format.html { redirect_to @card_manufacturer, notice: 'Card manufacturer was successfully created.' }
        format.json { render :show, status: :created, location: @card_manufacturer }
      else
        format.html { render :new }
        format.json { render json: @card_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_manufacturers/1
  # PATCH/PUT /card_manufacturers/1.json
  def update
    respond_to do |format|
      if @card_manufacturer.update(card_manufacturer_params)
        format.html { redirect_to @card_manufacturer, notice: 'Card manufacturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @card_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_manufacturers/1
  # DELETE /card_manufacturers/1.json
  def destroy
    @card_manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to card_manufacturers_url, notice: 'Card manufacturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_manufacturer
      @card_manufacturer = CardManufacturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_manufacturer_params
      params.require(:card_manufacturer).permit(:name)
    end
end
