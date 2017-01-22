class CardSizesController < ApplicationController
  before_action :set_card_size, only: [:show, :edit, :update, :destroy]

  # GET /card_sizes
  # GET /card_sizes.json
  def index
    @card_sizes = CardSize.all
  end

  # GET /card_sizes/1
  # GET /card_sizes/1.json
  def show
  end

  # GET /card_sizes/new
  def new
    @card_size = CardSize.new
  end

  # GET /card_sizes/1/edit
  def edit
  end

  # POST /card_sizes
  # POST /card_sizes.json
  def create
    @card_size = CardSize.new(card_size_params)

    respond_to do |format|
      if @card_size.save
        format.html { redirect_to @card_size, notice: 'Card size was successfully created.' }
        format.json { render :show, status: :created, location: @card_size }
      else
        format.html { render :new }
        format.json { render json: @card_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_sizes/1
  # PATCH/PUT /card_sizes/1.json
  def update
    respond_to do |format|
      if @card_size.update(card_size_params)
        format.html { redirect_to @card_size, notice: 'Card size was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_size }
      else
        format.html { render :edit }
        format.json { render json: @card_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_sizes/1
  # DELETE /card_sizes/1.json
  def destroy
    @card_size.destroy
    respond_to do |format|
      format.html { redirect_to card_sizes_url, notice: 'Card size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_size
      @card_size = CardSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_size_params
      params.require(:card_size).permit(:code, :name, :width, :height)
    end
end
