class CardFacesController < ApplicationController
  before_action :set_card_face, only: [:show, :edit, :update, :destroy]

  # GET /card_faces
  # GET /card_faces.json
  def index
    @card_faces = CardFace.all
  end

  # GET /card_faces/1
  # GET /card_faces/1.json
  def show
  end

  # GET /card_faces/new
  def new
    @card_face = CardFace.new
  end

  # GET /card_faces/1/edit
  def edit
  end

  # POST /card_faces
  # POST /card_faces.json
  def create
    @card_face = CardFace.new(card_face_params)

    respond_to do |format|
      if @card_face.save
        format.html { redirect_to @card_face, notice: 'Card face was successfully created.' }
        format.json { render :show, status: :created, location: @card_face }
      else
        format.html { render :new }
        format.json { render json: @card_face.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_faces/1
  # PATCH/PUT /card_faces/1.json
  def update
    respond_to do |format|
      if @card_face.update(card_face_params)
        format.html { redirect_to @card_face, notice: 'Card face was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_face }
      else
        format.html { render :edit }
        format.json { render json: @card_face.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_faces/1
  # DELETE /card_faces/1.json
  def destroy
    @card_face.destroy
    respond_to do |format|
      format.html { redirect_to card_faces_url, notice: 'Card face was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_face
      @card_face = CardFace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_face_params
      params.require(:card_face).permit(:family_id, :face_id, :print_seq_id, :customer_num, :plate_id, :card_size_id, :hd_color, :ace_type_id, :is_ace_serial, :is_custom_ta, :joker1_id, :joker2_id, :ad1_type_id, :ad2_type_id, :job_id, :art_id, :last_modified_by, :m36_id, :m40_id, :approved_date, :customer_approved_by, :approved_by, :comments)
    end
end
