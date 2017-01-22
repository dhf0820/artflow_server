class Api::V1::CardAceTypesController < Api::V1::ApiController
  
  before_action :set_card_ace_type, only: [:show, :edit, :update, :destroy]
  
  api :GET, '/card_ace_types', 'List of AceTypes'
  def index
    @card_ace_types = CardAceType.all
    render 'api/v1/card_ace_types/index'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card_face_type
    @card_ace_type = CardAceType.find(params[:id])
  end

  def card_ace_type_params
    params.require(:card_ace_type).permit(:id,:product_id, :customer_id, :customer_details, :customer_name, :customer_phone, :customer_email, :art_requested_by, :ship_date, :comments,
      product_type_ids: [],card_art_request_attributes: [:id, :design_id, :card_stock_id,:card_type_id, card_face_specs_attributes: [:id, :face_type_id,:color,:ace_id, :joker_id, :comments],
      card_back_specs_attributes: [:id, :back_type_id, :comments, :color]] ,attachments_attributes: [:id, :content, :_destroy])
     # 
  end
end

