class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]
  before_action :check_user, only: [:update, :destroy]

  # GET /videos
  def index
    @videos = Video.all

    render json: @videos
  end

  # GET /videos/1
  def show
    render json: @video
  end

  # POST /videos
  def create
    @video = Video.new(video_params)

    @video.save!
    render json: @video, status: :created, location: @video
  end

  # PATCH/PUT /videos/1
  def update
    @video.update!(video_params)
    render json: @video
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def check_user
      if @video.user_id == @current_user.id
        @video
      else
        render json: { "error": "Unable to process this request" }, status: :unprocessable_entity
      end
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.require(:video).permit(:title, :description, :content, :playlist_id).merge(user_id: @current_user.id)
    end
end
