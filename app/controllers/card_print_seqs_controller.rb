class CardPrintSeqsController < ApplicationController
  before_action :set_card_print_seq, only: [:show, :edit, :update, :destroy]

  # GET /card_print_seqs
  # GET /card_print_seqs.json
  def index
    @card_print_seqs = CardPrintSeq.all
  end

  # GET /card_print_seqs/1
  # GET /card_print_seqs/1.json
  def show
  end

  # GET /card_print_seqs/new
  def new
    @card_print_seq = CardPrintSeq.new
  end

  # GET /card_print_seqs/1/edit
  def edit
  end

  # POST /card_print_seqs
  # POST /card_print_seqs.json
  def create
    @card_print_seq = CardPrintSeq.new(card_print_seq_params)

    respond_to do |format|
      if @card_print_seq.save
        format.html { redirect_to @card_print_seq, notice: 'Print seq was successfully created.' }
        format.json { render :show, status: :created, location: @card_print_seq }
      else
        format.html { render :new }
        format.json { render json: @card_print_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_print_seqs/1
  # PATCH/PUT /card_print_seqs/1.json
  def update
    respond_to do |format|
      if @card_print_seq.update(card_print_seq_params)
        format.html { redirect_to @card_print_seq, notice: 'Print seq was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_print_seq }
      else
        format.html { render :edit }
        format.json { render json: @card_print_seq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_print_seqs/1
  # DELETE /card_print_seqs/1.json
  def destroy
    @card_print_seq.destroy
    respond_to do |format|
      format.html { redirect_to card_print_seqs_url, notice: 'Print seq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_print_seq
      @card_print_seq = CardPrintSeq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_print_seq_params
      params.require(:card_print_seq).permit(:name, :desc)
    end
end
