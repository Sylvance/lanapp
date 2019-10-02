# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  # GET /courses
  def index
    @courses = Course.by_date

    paginate json: @courses
  end

  # GET /courses/1
  def show
    authorize! :read, @course
    render json: @course
  end

  # POST /courses
  def create
    authorize! :create, Course
    @course = Course.new(course_params)
    @course&.banner&.attach(params[:course][:banner])

    @course.save!
    render json: @course, status: :created, location: @course
  end

  # PATCH/PUT /courses/1
  def update
    authorize! :update, @course
    @course.update!(course_params)
    render json: @course
  end

  # DELETE /courses/1
  def destroy
    authorize! :destroy, @course
    @course.banner.purge_later
    @course.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:title, :description, :banner).merge(user_id: @current_user.id)
  end
end
