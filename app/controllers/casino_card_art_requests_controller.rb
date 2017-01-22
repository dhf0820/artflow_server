class CasinoCardArtRequestsController < ApplicationController
  before_action :set_casino_card_art_request, only: [:show, :edit, :update, :destroy, :confirmation]
  before_action :set_art_request

  # GET /casino_card_art_requests
  # GET /casino_card_art_requests.json
  def index
    @casino_card_art_requests = CasinoCardArtRequest.all
  end

  # GET /casino_card_art_requests/1
  # GET /casino_card_art_requests/1.json
  def show
  end

  # GET /casino_card_art_requests/new
  def new
    @casino_card_art_request = CasinoCardArtRequest.new
  end

  # GET /casino_card_art_requests/1/edit
  def edit
  end

  def confirmation
    @casino_card_art_request.update_attribute(:confirmed, true)
    redirect_to [@art_request, @casino_card_art_request] 
  end

  # POST /casino_card_art_requests
  # POST /casino_card_art_requests.json
  def create
    @casino_card_art_request = CasinoCardArtRequest.new(casino_card_art_request_params)

    respond_to do |format|
      if @casino_card_art_request.save
        format.html { 
          @confirmation = true
          render :new
        }
        format.json { render :show, status: :created, location: @casino_card_art_request }
      else
        format.html { render :new }
        format.json { render json: @casino_card_art_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casino_card_art_requests/1
  # PATCH/PUT /casino_card_art_requests/1.json
  def update
    respond_to do |format|
      if @casino_card_art_request.update(casino_card_art_request_params)
        format.html { redirect_to [@art_request, @casino_card_art_request], notice: 'Casino card art request was successfully updated.' }
        format.json { render :show, status: :ok, location: @casino_card_art_request }
      else
        format.html { render :edit }
        format.json { render json: @casino_card_art_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casino_card_art_requests/1
  # DELETE /casino_card_art_requests/1.json
  def destroy
    @casino_card_art_request.destroy
    respond_to do |format|
      format.html { redirect_to casino_card_art_requests_url, notice: 'Casino card art request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_request
      @art_request = ArtRequest.find(params[:art_request_id])
    end
    def set_casino_card_art_request
      @casino_card_art_request = CasinoCardArtRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def casino_card_art_request_params
      params.require(:casino_card_art_request).permit(:customer_id, :customer_details, :customer_name, :customer_phone, :customer_email, :job_no, :paper_type_id, :card_type_id,
        :card_packaging_type_id, :art_request_id,
        art_request_specifications_attributes: [:id, :card_side_id, :face_style_id, :card_edge_id, :packaging_type_id, :first_color_id, :second_color_id, :third_color_id, :forth_color_id, :production_notes, :_destroy] )
    end
end
