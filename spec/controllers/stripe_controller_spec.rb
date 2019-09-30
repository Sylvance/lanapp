require 'rails_helper'

RSpec.describe StripeController, type: :controller do

  describe "GET #add_stripe_token" do
    it "returns http success" do
      get :add_stripe_token
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #pay_for_course" do
    it "returns http success" do
      get :pay_for_course
      expect(response).to have_http_status(:success)
    end
  end

end
