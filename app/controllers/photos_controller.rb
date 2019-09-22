# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show update destroy]

  # GET /photos
  def index
    @photos = Photo.all

    render json: @photos
  end

  # GET /photos/1
  def show
    authorize! :read, @photo
    render json: @photo
  end

  # POST /photos
  def create
    authorize! :create, Photo
    @photo = Photo.new(photo_params)
    @photo&.content&.attach(params[:photo][:content])

    @photo.save!
    render json: @photo, status: :created, location: @photo
  end

  # PATCH/PUT /photos/1
  def update
    authorize! :update, @photo
    @photo.update!(photo_params)
    render json: @photo
  end

  # DELETE /photos/1
  def destroy
    authorize! :destroy, @photo
    @photo.content.purge_later
    @photo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:title, :description, :content, :playlist_id).merge(user_id: @current_user.id)
  end
end
