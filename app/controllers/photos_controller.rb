class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]
  before_action :check_user, only: [:update, :destroy]

  # GET /photos
  def index
    @photos = Photo.all

    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    @photo.save!
    render json: @photo, status: :created, location: @photo
  end

  # PATCH/PUT /photos/1
  def update
    @photo.update!(photo_params)
    render json: @photo
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def check_user
      if @photo.user_id == @current_user.id
        @photo
      else
        render json: { "error": "Unable to process this request" }, status: :unprocessable_entity
      end
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:title, :description, :content, :playlist_id).merge(user_id: @current_user.id)
    end
end
