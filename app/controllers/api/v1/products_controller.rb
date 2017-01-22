class Api::V1::ProductsController < Api::V1::ApiController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    render 'api/v1/products/index'
  end

  def details
    @details = Product.details
    @products = []
    @products << {:id => @details[0][:id], :name => @details[0][:name] }
    @designs = @details[0][:items][0][:items]
    @card_stock_types = @details[0][:items][1][:items][0][:items] 
    @card_types = @details[0][:items][2][:items][0][:items]
    render :json => {:products => @products, :designs => @designs, :card_stock_types => @card_stock_types,
     :card_types => @card_types }
    #render 'api/v1/products/details'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

end

