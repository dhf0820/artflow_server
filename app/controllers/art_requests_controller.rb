class ArtRequestsController < ApplicationController
  before_action :set_art_request, only: [:show, :edit, :update, :destroy]

  # GET /art_requests/processing_count
  def processing_count
    render plain: ArtRequestSpecification.where(card_side_id: params[:side]).select{|ars| ars.casino_card_art_request.confirmed }.count.to_s
  end

  # GET /art_requests
  # GET /art_requests.json
  def index
    @art_requests = ArtRequest.all
  end

  def search
    @q = params[:search]
    @flag = params[:search_flag]
    @art_requests = ArtRequest.search(@flag,@q)

    respond_to do |format|
      format.html { render 'index'}
    end
  end

  # GET /art_requests/1
  # GET /art_requests/1.json
  def show
  end

  # GET /art_requests/new
  def new
    @flag = params[:flag] || params[:customer][:flag]
    if @flag == "CUSTOMER"
      @customer = Customer.new
    elsif @flag == "NEW_CUST"
      @customer = Customer.new(customer_params)
      @customer.save
      @art_request = @customer.art_requests.new
      @card_art_request = @art_request.build_card_art_request
      @card_art_request.card_face_specs.build
      @card_art_request.card_back_specs.build
      @product = Product.details

    elsif @flag == "CUST_ART_REQ"
      @customer = Customer.find(params[:customer][:id])
      @art_request = @customer.art_requests.new
      @card_art_request = @art_request.build_card_art_request
      @product = Product.details
    else
      @art_request = ArtRequest.new
    end
  end

  def new_specification
    binding.pry
    @card_art_request = params[:ca_id]

    respond_to do |format|
      format.js {}
    end
  end

  # GET /art_requests/1/edit
  def edit
    @card_art_request = CardArtRequest.for_art_request(@art_request)
    #binding.pry
    @product = Product.details
  end

  # POST /art_requests
  # POST /art_requests.json
  def create
    @customer = Customer.find(params[:art_request][:customer_id])
    @art_request = @customer.art_requests.new(art_request_params)
    
    #binding.pry
    respond_to do |format|
      if @art_request.save
        format.html { redirect_to art_requests_path, notice: 'Art request was successfully created.' }
        format.json { render :show, status: :created, location: @art_request }
      else
        format.html { render :new }
        format.json { render json: @art_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_requests/1
  # PATCH/PUT /art_requests/1.json
  def update
    respond_to do |format|
      if @art_request.update(art_request_params)
        format.html { redirect_to art_requests_path , notce: 'Art request was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_request }
      else
        format.html { render :edit }
        format.json { render json: @art_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_requests/1
  # DELETE /art_requests/1.json
  def destroy
    @art_request.destroy
    respond_to do |format|
      format.html { redirect_to art_requests_url, notice: 'Art request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_request
      @art_request = ArtRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_request_params
      params.require(:art_request).permit(:id,:product_id, :customer_id, :customer_details, :customer_name, :customer_phone, :customer_email, :art_requested_by, :ship_date, :comments,
        product_type_ids: [],card_art_request_attributes: [:id, :design_id, :card_stock_id,:card_type_id, card_face_specs_attributes: [:id, :face_type_id,:color,:ace_id, :joker_id, :comments],
        card_back_specs_attributes: [:id, :back_type_id, :comments, :color]] ,attachments_attributes: [:id, :content, :_destroy])
       # 
    end

    def customer_params
      params.require(:customer).permit(:sage_id, :name, :address1, :address2, :address3, :contact_name, :contact_email, :contact_phone, :customer_no, :city, :state, :country_code, :sales_preson_no, :zipcode)
    end
end
