class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  before_action :check_user, only: [:update, :destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    @course.banner.attach(params[:course][:banner]) if @course

    @course.save!
    render json: @course, status: :created, location: @course
  end

  # PATCH/PUT /courses/1
  def update
    @course.update!(course_params)
    render json: @course
  end

  # DELETE /courses/1
  def destroy
    @course.banner.purge_later
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def check_user
      if @course.user_id == @current_user.id
        @course
      else
        render json: { "success": false,
          "errors": [
              {
                  "resource": "course",
                  "field": "id",
                  "code": 1044,
                  "message": "Unable to process this request"
              }
          ]}, status: :unprocessable_entity
      end
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:title, :description, :banner).merge(user_id: @current_user.id)
    end
end
