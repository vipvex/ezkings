class PagesController < ApplicationController
  layout 'full_width_no_padding', :only => [:home]
  
  before_action :set_page, only: [:edit, :update, :destroy]

  load_and_authorize_resource
  skip_authorize_resource :only => [:home, :verification]


  def index
    @pages = Page.all
  end
  
    
  def home
    @content = Page.find_by(name: 'home').content
    @highlights_cards = CardHighlight.all.collect(&:card)    
    @recently_added_cards = Card.last(10)
    
    prepare_meta_tags(title: "EZ Kings Cards: The #1 Marketplace For Los Angeles Kings Hockey Trading Cards", 
                      site: '',
                      description: 'EZ Kings Card\'s is The Best LA Kings Hockey Cards Marketplace. Buy Cards Online!')
  end

  def contact_us
    prepare_meta_tags(title: "Contact Us") 
  end
  
  def contact_message
    
    
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new 'key-9737cd05379b3a299a36a35520ff43c3'
    
    # Define your message parameters
    message_params =  { from: params[:email],
                        to:   'alexander@alexandersacademy.org',
                        subject: params[:subject],
                        text:    params[:message]
                      }
    
    # Send your message through the client
    mg_client.send_message 'sandbox5fc213c9dd9e47fb8eb66a9d931faaff.mailgun.org', message_params
    
    respond_to do |format|
      # Sends email to user when user is created.
      #ContactUsMailer.contact_us(params[:email], params[:subject], params[:message]).deliver

      format.html { redirect_to :back, notice: 'Email sent!' }
    end
  end

  def control
  end

  def show
    @page = Page.find_by(url: params[:url]) or not_found
    
    prepare_meta_tags(title: @page.name,
                      description: @page.short_content,
                      keywords: "")
  end


  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to "/#{@page.url}", notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to "/#{@page.url}", notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :url, :content, :layout, :show, :order)
    end
end
