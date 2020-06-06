require 'rails_helper'

RSpec.describe "Exhibitions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/exhibition/new"
      expect(response).to have_http_status(:success)
    end
  end

end
