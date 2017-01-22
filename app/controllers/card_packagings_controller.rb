class CardPackagingsController < ApplicationController
  before_action :set_card_packaging, only: [:show, :edit, :update, :destroy]

  # GET /card_packagings
  # GET /card_packagings.json
  def index
    @card_packagings = CardPackaging.all
  end

  # GET /card_packagings/1
  # GET /card_packagings/1.json
  def show
  end

  # GET /card_packagings/new
  def new
    @card_packaging = CardPackaging.new
  end

  # GET /card_packagings/1/edit
  def edit
  end

  # POST /card_packagings
  # POST /card_packagings.json
  def create
    @card_packaging = CardPackaging.new(card_packaging_params)

    respond_to do |format|
      if @card_packaging.save
        format.html { redirect_to @card_packaging, notice: 'CardPackaging was successfully created.' }
        format.json { render :show, status: :created, location: @card_packaging }
      else
        format.html { render :new }
        format.json { render json: @card_packaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_packagings/1
  # PATCH/PUT /card_packagings/1.json
  def update
    respond_to do |format|
      if @card_packaging.update(card_packaging_params)
        format.html { redirect_to @card_packaging, notice: 'CardPackaging was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_packaging }
      else
        format.html { render :edit }
        format.json { render json: @card_packaging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_packagings/1
  # DELETE /card_packagings/1.json
  def destroy
    @card_packaging.destroy
    respond_to do |format|
      format.html { redirect_to card_packagings_url, notice: 'CardPackaging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_packaging
      @card_packaging = CardPackaging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_packaging_params
      params.require(:card_packaging).permit(:name, :desc, :item_num)
    end
end
