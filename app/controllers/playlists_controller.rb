class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :destroy]
  before_action :check_user, only: [:update, :destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists
  end

  # GET /playlists/1
  def show
    render json: @playlist
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)

    @playlist.save!
    render json: @playlist, status: :created, location: @playlist
  end

  # PATCH/PUT /playlists/1
  def update
    @playlist.update!(playlist_params)
    render json: @playlist
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def check_user
      if @playlist.user_id == @current_user.id
        @playlist
      else
        render json: { "success": false,
          "errors": [
              {
                  "resource": "playlist",
                  "field": "id",
                  "code": 1044,
                  "message": "Unable to process this request"
              }
          ]}, status: :unprocessable_entity
      end
    end

    # Only allow a trusted parameter "white list" through.
    def playlist_params
      params.require(:playlist).permit(:title, :description, :banner).merge(user_id: @current_user.id)
    end
end
