class CardColorsController < ApplicationController
  before_action :set_card_color, only: [:show, :edit, :update, :destroy]

  # GET /card_colors
  # GET /card_colors.json
  def index
    @card_colors = CardColor.all
  end

  # GET /card_colors/1
  # GET /card_colors/1.json
  def show
  end

  # GET /card_colors/new
  def new
    @card_color = CardColor.new
  end

  # GET /card_colors/1/edit
  def edit
  end

  # POST /card_colors
  # POST /card_colors.json
  def create
    @card_color = CardColor.new(card_color_params)

    respond_to do |format|
      if @card_color.save
        format.html { redirect_to @card_color, notice: 'Card color was successfully created.' }
        format.js { render :create }
        format.json { render :show, status: :created, location: @card_color }
      else
        format.html { render :new }
        format.json { render json: @card_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_colors/1
  # PATCH/PUT /card_colors/1.json
  def update
    respond_to do |format|
      if @card_color.update(card_color_params)
        format.html { redirect_to @card_color, notice: 'Card color was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_color }
      else
        format.html { render :edit }
        format.json { render json: @card_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_colors/1
  # DELETE /card_colors/1.json
  def destroy
    @card_color.destroy
    respond_to do |format|
      format.html { redirect_to card_colors_url, notice: 'Card color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_color
      @card_color = CardColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_color_params
      params.require(:card_color).permit(:name, :c, :y, :m, :k, :user_generated)
    end
end
