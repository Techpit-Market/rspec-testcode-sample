require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :request do
  describe '正常' do
    context "アンケートに回答する" do
      it "回答できること" do
        get "/food_enquetes/new"
        expect(response).to have_http_status(200)
  
        post "/food_enquetes", params: { food_enquete: FactoryBot.attributes_for(:food_enquete_tanaka) }
        follow_redirect!
        expect(response.body).to include "お食事に関するアンケートを送信しました"
      end
    end
  end

  describe '異常' do
    context "アンケートに回答する" do
      it "エラーメッセージが表示されること" do
        get "/food_enquetes/new"
        expect(response).to have_http_status(200)
    
        post "/food_enquetes", params: { food_enquete: { name: '' } }
        expect(response.body).not_to include "お食事に関するアンケートを送信しました"
      end
    end
  end
end
