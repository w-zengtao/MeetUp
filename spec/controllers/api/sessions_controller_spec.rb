require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  describe "POST 'create'" do
    it "should return error without an right email add" do
      post :create,  { user: { name: "invalid", password: "aaaaaaa"} }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["status"]).to eq(404)
    end

    it "should return auth_token with right password" do
      User.destroy_all
      user = User.create!(name: "rspec", password: "aaaaaa", password_confirmation: 'aaaaaa')
      post :create,  { name: "rspec", password: "aaaaaa"}

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["status"]).to eq(200)
      expect(parsed_response["user"]["auth_token"]).to eq(user.auth_token)
    end

  end
end
