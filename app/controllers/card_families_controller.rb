class CardFamiliesController < ApplicationController
  before_action :set_card_family, only: [:show, :edit, :update, :destroy]

  # GET /card_families
  # GET /card_families.json
  def index
    @card_families = CardFamily.all
  end

  # GET /card_families/1
  # GET /card_families/1.json
  def show
  end

  # GET /card_families/new
  def new
    @card_family = CardFamily.new
  end

  # GET /card_families/1/edit
  def edit
  end

  # POST /card_families
  # POST /card_families.json
  def create
    @card_family = CardFamily.new(card_family_params)

    respond_to do |format|
      if @card_family.save
        format.html { redirect_to @card_family, notice: 'Card family was successfully created.' }
        format.json { render :show, status: :created, location: @card_family }
      else
        format.html { render :new }
        format.json { render json: @card_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_families/1
  # PATCH/PUT /card_families/1.json
  def update
    respond_to do |format|
      if @card_family.update(card_family_params)
        format.html { redirect_to @card_family, notice: 'Card family was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_family }
      else
        format.html { render :edit }
        format.json { render json: @card_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_families/1
  # DELETE /card_families/1.json
  def destroy
    @card_family.destroy
    respond_to do |format|
      format.html { redirect_to card_families_url, notice: 'Card family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_family
      @card_family = CardFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_family_params
      params.require(:card_family).permit(:code, :side, :desc)
    end
end
