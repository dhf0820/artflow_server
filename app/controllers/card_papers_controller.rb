class CardPapersController < ApplicationController
  before_action :set_card_paper, only: [:show, :edit, :update, :destroy]

  # GET /card_papers
  # GET /card_papers.json
  def index
    @card_papers = CardPaper.all
  end

  # GET /card_papers/1
  # GET /card_papers/1.json
  def show
  end

  # GET /card_papers/new
  def new
    @card_paper = CardPaper.new
  end

  # GET /card_papers/1/edit
  def edit
  end

  # POST /card_papers
  # POST /card_papers.json
  def create
    @card_paper = CardPaper.new(card_paper_params)

    respond_to do |format|
      if @card_paper.save
        format.html { redirect_to @card_paper, notice: 'Card paper was successfully created.' }
        format.json { render :show, status: :created, location: @card_paper }
      else
        format.html { render :new }
        format.json { render json: @card_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_papers/1
  # PATCH/PUT /card_papers/1.json
  def update
    respond_to do |format|
      if @card_paper.update(card_paper_params)
        format.html { redirect_to @card_paper, notice: 'Card paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_paper }
      else
        format.html { render :edit }
        format.json { render json: @card_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_papers/1
  # DELETE /card_papers/1.json
  def destroy
    @card_paper.destroy
    respond_to do |format|
      format.html { redirect_to card_papers_url, notice: 'Card paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_paper
      @card_paper = CardPaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_paper_params
      params.require(:card_paper).permit(:code, :name, :finish)
    end
end
