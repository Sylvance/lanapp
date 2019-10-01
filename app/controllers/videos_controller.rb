# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :set_video, only: %i[show update destroy]

  # GET /videos
  def index
    @videos = Video.by_date

    paginate json: @videos, per_page: 3
  end

  # GET /videos/1
  def show
    authorize! :read, @video
    render json: @video
  end

  # POST /videos
  def create
    authorize! :create, Video
    @video = Video.new(video_params)
    @video&.content&.attach(params[:video][:content])

    @video.save!
    render json: @video, status: :created, location: @video
  end

  # PATCH/PUT /videos/1
  def update
    authorize! :update, @video
    @video.update!(video_params)
    render json: @video
  end

  # DELETE /videos/1
  def destroy
    authorize! :destroy, @video
    @video.content.purge_later
    @video.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def video_params
    params.require(:video).permit(:title, :description, :content, :playlist_id).merge(user_id: @current_user.id)
  end
end
