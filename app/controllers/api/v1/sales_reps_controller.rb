class Api::V1::SalesRepsController < Api::V1::ApiController
  
  before_action :set_sales_rep, only: [:show, :edit, :update, :destroy]

  def index
    @sales_reps = SalesRep.all
    render 'api/v1/sales_reps/index'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sales_rep
    @sales_rep = SalesRep.find(params[:id])
  end

end

