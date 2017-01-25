class Api::V1::ArtistsController < Api::V1::ApiController

  before_action :set_artist, only: [:show, :edit, :update, :destroy, :on_holds, :next_job ]

  api :GET, '/artists', 'List of Artists'
  def index
    @artists = Artist.order('name DESC')
    render 'api/v1/artists/index'
  end

  api :GET, '/artists/:id', 'specific artist'
  def show

    @artist = Artist.find(params[:id])
    puts "artist = #{@artist.inspect}"
    render 'api/v1/artists/show'
  end

  api :POST, '/artists', 'Create Artist'
  description 'Create Artist'
  param :artist, Hash, desc: 'Artist Info', :required => true do
    param :name, String, desc: 'Name of artist'
    param :short_name, String, desc: 'Letters use in icon'
  end


  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render '/api/v1/artists/show', status: :created
    else
      errors = @art_request.errors.full_messages
      render json: {:error => errors}, status: :unprocessable_entity
    end

  end

  api :PATCH, '/artists/:id', 'Update Artist'
  description 'Update Artist'
  param :artist, Hash, desc: 'Artist Info', :required => true do
    param :name, String, desc: 'Name of artist'
    param :short_name, String, desc: 'Letters use in icon'
  end

  def update
    if @artist.update(art_request_params)
      render '/api/v1/art_requests/show', status: :ok
    else
      errors = @artist.errors.full_messages
      render json: {:error => errors}, status: :unprocessable_entity
    end
  end


  def on_holds

  end

  def next_job #
    @artist = Artist.find(params[:id])
    @art_request = @artist.next_job
    puts "artist = #{@artist.inspect}"
    puts "request: #{@art_request.inspect}"
    render 'api/v1/art_requests/show/'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:art_request).permit(:id,:name, :email, :short_name, :phone)
    #
  end
end

