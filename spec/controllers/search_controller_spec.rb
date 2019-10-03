require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #search_courses" do
    it "returns http success" do
      get :search_courses
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search_playlists" do
    it "returns http success" do
      get :search_playlists
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search_videos" do
    it "returns http success" do
      get :search_videos
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search_photos" do
    it "returns http success" do
      get :search_photos
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search_users" do
    it "returns http success" do
      get :search_users
      expect(response).to have_http_status(:success)
    end
  end

end
