class StripeController < ApplicationController
  require 'stripe'
  before_action :set_course, only: %i[pay_for_course]

  def add_stripe_token
    # authorize! :update, User
    @current_user.update!(user_stripe_token_params)
    render json: @current_user
  end

  def pay_for_course
    # do stripe charges
    Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

    token = @current_user.token

    charge = Stripe::Charge.create({
        amount: 90,
        currency: 'usd',
        description: @course.title,
        source: token,
        statement_descriptor: 'Course charges',
        metadata: {'course_id' => @course.id},
    })

    if charge.paid == true && charge.status == 'succeeded'
      # assign viewer role to course
      @current_user.assign_viewer_role(@course)
      render json: @course
    else
      render json: {errors: {'charge errors, aborted.'}, @course}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_stripe_token_params
    params.require(:user).permit(:token)
  end
end
