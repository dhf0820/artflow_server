class CardEdgesController < ApplicationController
  before_action :set_card_edge, only: [:show, :edit, :update, :destroy]

  # GET /card_edges
  # GET /card_edges.json
  def index
    @card_edges = CardEdge.all
  end

  # GET /card_edges/1
  # GET /card_edges/1.json
  def show
  end

  # GET /card_edges/new
  def new
    @card_edge = CardEdge.new
  end

  # GET /card_edges/1/edit
  def edit
  end

  # POST /card_edges
  # POST /card_edges.json
  def create
    @card_edge = CardEdge.new(card_edge_params)

    respond_to do |format|
      if @card_edge.save
        format.html { redirect_to @card_edge, notice: 'Card edge was successfully created.' }
        format.json { render :show, status: :created, location: @card_edge }
      else
        format.html { render :new }
        format.json { render json: @card_edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_edges/1
  # PATCH/PUT /card_edges/1.json
  def update
    respond_to do |format|
      if @card_edge.update(card_edge_params)
        format.html { redirect_to @card_edge, notice: 'Card edge was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_edge }
      else
        format.html { render :edit }
        format.json { render json: @card_edge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_edges/1
  # DELETE /card_edges/1.json
  def destroy
    @card_edge.destroy
    respond_to do |format|
      format.html { redirect_to card_edges_url, notice: 'Card edge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_edge
      @card_edge = CardEdge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_edge_params
      params.require(:card_edge).permit(:name, :desc, :ref_image_url, :photo)
    end
end
