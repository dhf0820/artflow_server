class Api::V1::CustomersController < Api::V1::ApiController
  
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    render 'api/v1/customers/index'
  end

  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render '/api/v1/customers/show', status: :created
    else
      errors = @customer.errors.full_messages
      render json: {:error => errors}, status: :unprocessable_entity
    end
  end

  def customer_search
    @customer = Customer.find_by_sage_id(params[:sage_id]) 

    if @customer
      render '/api/v1/customers/show', status: 200
    else
      render json: {:error => 'No customer found'}, status: 200
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @product =Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:sage_id, :name, :address1, :address2, :address3, :contact_name, :contact_email, :contact_phone, :customer_no, :city, :state, :country_code, :sales_rep_id, :zipcode)
  end

end

