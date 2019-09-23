require 'rails_helper'

RSpec.describe "GymEnquetes", type: :request do
  describe "GET /gym_enquetes" do
    it "works! (now write some real specs)" do
      get gym_enquetes_path
      expect(response).to have_http_status(200)
    end
  end
end
