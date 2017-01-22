class CardMfgUnitsController < ApplicationController
  before_action :set_card_mfg_unit, only: [:show, :edit, :update, :destroy]

  # GET /card_mfg_units
  # GET /card_mfg_units.json
  def index
    @card_mfg_units = CardMfgUnit.all
  end

  # GET /card_mfg_units/1
  # GET /card_mfg_units/1.json
  def show
  end

  # GET /card_mfg_units/new
  def new
    @card_mfg_unit = CardMfgUnit.new
  end

  # GET /card_mfg_units/1/edit
  def edit
  end

  # POST /card_mfg_units
  # POST /card_mfg_units.json
  def create
    @card_mfg_unit = CardMfgUnit.new(card_mfg_unit_params)

    respond_to do |format|
      if @card_mfg_unit.save
        format.html { redirect_to @card_mfg_unit, notice: 'Mfg unit was successfully created.' }
        format.json { render :show, status: :created, location: @card_mfg_unit }
      else
        format.html { render :new }
        format.json { render json: @card_mfg_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_mfg_units/1
  # PATCH/PUT /card_mfg_units/1.json
  def update
    respond_to do |format|
      if @card_mfg_unit.update(card_mfg_unit_params)
        format.html { redirect_to @card_mfg_unit, notice: 'Mfg unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_mfg_unit }
      else
        format.html { render :edit }
        format.json { render json: @card_mfg_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_mfg_units/1
  # DELETE /card_mfg_units/1.json
  def destroy
    @card_mfg_unit.destroy
    respond_to do |format|
      format.html { redirect_to card_mfg_units_url, notice: 'Mfg unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_mfg_unit
      @card_mfg_unit = CardMfgUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_mfg_unit_params
      params.require(:card_mfg_unit).permit(:name, :desc, :itsmshnam, :product_id, :dsp_order, :pkg_count)
    end
end
