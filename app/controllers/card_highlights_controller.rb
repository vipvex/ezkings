class CardHighlightsController < ApplicationController
  before_action :set_card_highlight, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /card_highlights
  # GET /card_highlights.json
  def index
    @card_highlights = CardHighlight.all
  end

  # GET /card_highlights/1
  # GET /card_highlights/1.json
  def show
  end

  # GET /card_highlights/new
  def new
    @card_highlight = CardHighlight.new
  end

  # GET /card_highlights/1/edit
  def edit
  end

  # POST /card_highlights
  # POST /card_highlights.json
  def create
    @card_highlight = CardHighlight.new(card_highlight_params)

    respond_to do |format|
      if @card_highlight.save
        format.html { redirect_to @card_highlight, notice: 'Card highlight was successfully created.' }
        format.json { render :show, status: :created, location: @card_highlight }
      else
        format.html { render :new }
        format.json { render json: @card_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_highlights/1
  # PATCH/PUT /card_highlights/1.json
  def update
    respond_to do |format|
      if @card_highlight.update(card_highlight_params)
        format.html { redirect_to @card_highlight, notice: 'Card highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_highlight }
      else
        format.html { render :edit }
        format.json { render json: @card_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_highlights/1
  # DELETE /card_highlights/1.json
  def destroy
    @card_highlight.destroy
    respond_to do |format|
      format.html { redirect_to card_highlights_url, notice: 'Card highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_highlight
      @card_highlight = CardHighlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_highlight_params
      params.require(:card_highlight).permit(:card_id)
    end
end
