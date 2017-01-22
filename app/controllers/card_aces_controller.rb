class CardAcesController < ApplicationController
  before_action :set_card_ace, only: [:show, :edit, :update, :destroy]

  # GET /card_aces
  # GET /card_aces.json
  def index
    @card_aces = CardAce.all
  end

  # GET /card_aces/1
  # GET /card_aces/1.json
  def show
  end

  # GET /card_aces/new
  def new
    @card_ace = CardAce.new
  end

  # GET /card_aces/1/edit
  def edit
  end

  # POST /card_aces
  # POST /card_aces.json
  def create
    @card_ace = CardAce.new(card_ace_params)

    respond_to do |format|
      if @card_ace.save
        format.html { redirect_to @card_ace, notice: 'CardAce was successfully created.' }
        format.json { render :show, status: :created, location: @card_ace }
      else
        format.html { render :new }
        format.json { render json: @card_ace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_aces/1
  # PATCH/PUT /card_aces/1.json
  def update
    respond_to do |format|
      if @card_ace.update(card_ace_params)
        format.html { redirect_to @card_ace, notice: 'CardAce was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_ace }
      else
        format.html { render :edit }
        format.json { render json: @card_ace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_aces/1
  # DELETE /card_aces/1.json
  def destroy
    @card_ace.destroy
    respond_to do |format|
      format.html { redirect_to card_aces_url, notice: 'CardAce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_ace
      @card_ace = CardAce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_ace_params
      params.require(:card_ace).permit(:code, :name, :image_url, :photo)
    end
end
