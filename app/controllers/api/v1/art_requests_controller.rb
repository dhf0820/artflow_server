class Api::V1::ArtRequestsController < Api::V1::ApiController
  
  before_action :set_art_request, only: [:show, :edit, :update, :destroy]

  api :GET, '/art_requests', 'List of ArtRequests'
  def index
    @art_requests = ArtRequest.limit(10).order('id DESC')
    render 'api/v1/art_requests/index'
  end

  api :POST, '/art_requests', 'Create Art Request'
  description 'Create Art Request'
  # param :art_request, Hash, desc: 'ArtRequest Information', :required => true do
  #   param :product_id, String, desc: 'Product Info'
  # end

  def create
    @customer = Customer.find(params[:art_request][:customer_id])
    @art_request = @customer.art_requests.new(art_request_params)
    
    if @art_request.save
      render '/api/v1/art_requests/show', status: :created
    else
      errors = @art_request.errors.full_messages
      render json: {:error => errors}, status: :unprocessable_entity
    end

  end

  api :PATCH, '/art_requests/:id', 'Update ArtRequest'
  description 'Update ArtRequest'
  param :art_request, Hash, desc: 'ArtRequest Info', :required => true do
    param :product_id, String, desc: 'Product Info' 
  end

  def update
    if @art_request.update(art_request_params)
      render '/api/v1/art_requests/show', status: :ok
    else
      errors = @art_request.errors.full_messages
      render json: {:error => errors}, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_art_request
    @art_request = ArtRequest.find(params[:id])
  end

  def art_request_params
    params.require(:art_request).permit(:id,:product_id, :art_requested_date, :shipment_date, :customer_id, :customer_details, :customer_name, :customer_phone, :customer_email, :art_requested_by, :ship_date, :comments,
      product_type_ids: [],card_art_request_attributes: [:id, :design_id, :card_stock_id,:card_type_id, card_face_specs_attributes: [:id, :face_type_id,:color,:ace_id, :joker_id, :comments],
      card_back_specs_attributes: [:id, :back_type_id, :comments, :color]] ,attachments_attributes: [:id, :content, :_destroy])
     # 
  end
end

