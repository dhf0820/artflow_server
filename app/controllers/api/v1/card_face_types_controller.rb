class Api::V1::CardFaceTypesController < Api::V1::ApiController
  
  before_action :set_card_face_type, only: [:show, :edit, :update, :destroy]

  def index
    @card_face_types = CardFaceType.all
    render 'api/v1/card_face_types/index'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card_face_type
    @card_face_type = CardFaceType.find(params[:id])
  end

  def card_face_type_params
    params.require(:card_face_type).permit(:id,:product_id, :customer_id, :customer_details, :customer_name, :customer_phone, :customer_email, :art_requested_by, :ship_date, :comments,
      product_type_ids: [],card_art_request_attributes: [:id, :design_id, :card_stock_id,:card_type_id, card_face_specs_attributes: [:id, :face_type_id,:color,:ace_id, :joker_id, :comments],
      card_back_specs_attributes: [:id, :back_type_id, :comments, :color]] ,attachments_attributes: [:id, :content, :_destroy])
     # 
  end
end

