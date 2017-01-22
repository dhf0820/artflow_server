class CardOrderTypesController < ApplicationController
  before_action :set_card_order_type, only: [:show, :edit, :update, :destroy]

  # GET /card_order_types
  # GET /card_order_types.json
  def index
    @card_order_types = CardOrderType.all
  end

  # GET /card_order_types/1
  # GET /card_order_types/1.json
  def show
  end

  # GET /card_order_types/new
  def new
    @card_order_type = CardOrderType.new
  end

  # GET /card_order_types/1/edit
  def edit
  end

  # POST /card_order_types
  # POST /card_order_types.json
  def create
    @card_order_type = CardOrderType.new(card_order_type_params)

    respond_to do |format|
      if @card_order_type.save
        format.html { redirect_to @card_order_type, notice: 'Order type was successfully created.' }
        format.json { render :show, status: :created, location: @card_order_type }
      else
        format.html { render :new }
        format.json { render json: @card_order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_order_types/1
  # PATCH/PUT /card_order_types/1.json
  def update
    respond_to do |format|
      if @card_order_type.update(card_order_type_params)
        format.html { redirect_to @card_order_type, notice: 'Order type was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_order_type }
      else
        format.html { render :edit }
        format.json { render json: @card_order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_order_types/1
  # DELETE /card_order_types/1.json
  def destroy
    @card_order_type.destroy
    respond_to do |format|
      format.html { redirect_to card_order_types_url, notice: 'Order type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_order_type
      @card_order_type = CardOrderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_order_type_params
      params.require(:card_order_type).permit(:name)
    end
end
