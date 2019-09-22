# frozen_string_literal: true

class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show update destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists
  end

  # GET /playlists/1
  def show
    authorize! :read, @playlist
    render json: @playlist
  end

  # POST /playlists
  def create
    authorize! :create, Playlist
    @playlist = Playlist.new(playlist_params)
    @playlist&.banner&.attach(params[:playlist][:banner])

    @playlist.save!
    render json: @playlist, status: :created, location: @playlist
  end

  # PATCH/PUT /playlists/1
  def update
    authorize! :update, @playlist
    @playlist.update!(playlist_params)
    render json: @playlist
  end

  # DELETE /playlists/1
  def destroy
    authorize! :destroy, @playlist
    @playlist.banner.purge_later
    @playlist.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def playlist_params
    params.require(:playlist).permit(:title, :description, :banner, :course_id).merge(user_id: @current_user.id)
  end
end
