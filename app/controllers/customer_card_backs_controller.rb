class CustomerCardBacksController < ApplicationController
  before_action :set_customer_card_back, only: [:show, :edit, :update, :destroy]

  # GET /customer_card_backs
  # GET /customer_card_backs.json
  def index
    @customer_card_backs = CustomerCardBack.all
  end

  # GET /customer_card_backs/1
  # GET /customer_card_backs/1.json
  def show
  end

  # GET /customer_card_backs/new
  def new
    @customer_card_back = CustomerCardBack.new
  end

  # GET /customer_card_backs/1/edit
  def edit
  end

  # POST /customer_card_backs
  # POST /customer_card_backs.json
  def create
    @customer_card_back = CustomerCardBack.new(customer_card_back_params)

    respond_to do |format|
      if @customer_card_back.save
        format.html { redirect_to @customer_card_back, notice: 'Customer card back was successfully created.' }
        format.json { render :show, status: :created, location: @customer_card_back }
      else
        format.html { render :new }
        format.json { render json: @customer_card_back.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_card_backs/1
  # PATCH/PUT /customer_card_backs/1.json
  def update
    respond_to do |format|
      if @customer_card_back.update(customer_card_back_params)
        format.html { redirect_to @customer_card_back, notice: 'Customer card back was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_card_back }
      else
        format.html { render :edit }
        format.json { render json: @customer_card_back.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_card_backs/1
  # DELETE /customer_card_backs/1.json
  def destroy
    @customer_card_back.destroy
    respond_to do |format|
      format.html { redirect_to customer_card_backs_url, notice: 'Customer card back was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_card_back
      @customer_card_back = CustomerCardBack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_card_back_params
      params.require(:customer_card_back).permit(:family_id, :back_id, :print_seq_id, :customer_number, :card_size_id, :plate_id, :job_id, :art_id, :approved_date, :customer_approved_by, :approval_entered_by, :comments)
    end
end
