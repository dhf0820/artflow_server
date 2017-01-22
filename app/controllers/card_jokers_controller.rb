class CardJokersController < ApplicationController
  before_action :set_card_joker, only: [:show, :edit, :update, :destroy]

  # GET /card_jokers
  # GET /card_jokers.json
  def index
    @card_jokers = CardJoker.all
  end

  # GET /card_jokers/1
  # GET /card_jokers/1.json
  def show
  end

  # GET /card_jokers/new
  def new
    @card_joker = CardJoker.new
  end

  # GET /card_jokers/1/edit
  def edit
  end

  # POST /card_jokers
  # POST /card_jokers.json
  def create
    @card_joker = CardJoker.new(card_joker_params)

    respond_to do |format|
      if @card_joker.save
        format.html { redirect_to @card_joker, notice: 'CardJoker was successfully created.' }
        format.json { render :show, status: :created, location: @card_joker }
      else
        format.html { render :new }
        format.json { render json: @card_joker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_jokers/1
  # PATCH/PUT /card_jokers/1.json
  def update
    respond_to do |format|
      if @card_joker.update(card_joker_params)
        format.html { redirect_to @card_joker, notice: 'CardJoker was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_joker }
      else
        format.html { render :edit }
        format.json { render json: @card_joker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_jokers/1
  # DELETE /card_jokers/1.json
  def destroy
    @card_joker.destroy
    respond_to do |format|
      format.html { redirect_to card_jokers_url, notice: 'CardJoker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_joker
      @card_joker = CardJoker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_joker_params
      params.require(:card_joker).permit(:code, :name, :image_url, :photo)
    end
end
