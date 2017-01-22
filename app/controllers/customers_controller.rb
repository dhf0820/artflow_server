class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers/details
  def details
    @customer = Customer.find_by_sage_id params[:sage_id]
    render json: @customer.to_json
  end

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def customer_search
    @customer = params[:value].present? ? Customer.find_by_sage_id(params[:value]) : Customer.new

    return true if @customer.blank?
    respond_to do |format|
      format.json {  render :json => { :attachmentPartial => render_to_string(:partial =>'customers/customer_form.html.haml', :layout => false, :locals => { :@customer => @customer }) }}
      format.html {}
    end
  end

  def autocomplete
    @customers = Customer.search(params[:term])
    respond_to do |format|
      format.html
      format.json { 
        render json: @customers.map {|customer| { :label => customer.name, :value => customer.id }}
      }
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def customer_from_csv
    if request.get?

    else request.post?
      begin
        Customer.import(params[:file])
        redirect_to :back, notice: "Customers imported."
      rescue
        redirect_to :back, notice: "Invalid CSV file format."
      end
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:sage_id, :name, :address1, :address2, :address3, :contact_name, :contact_email, :contact_phone, :customer_no, :city, :state, :country_code, :sales_preson_no, :zipcode)
    end
end
