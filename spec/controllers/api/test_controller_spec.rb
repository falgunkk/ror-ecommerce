require "rails_helper"
RSpec.describe Api::TestController, type: :controller do
  context "check methods" do
    it "Gets success in public api method" do
      get :public_api
      expect(JSON.parse(response.body)["status"]).to eq("success")
    end

    it "Gets success in private api method" do
      email="test@test.com"
      password="test123"
      user1 = create(:user,email:email,password:password)
      token=AuthenticateUser.new(email, password).call
      request.headers["Authorization"] = "Bearer #{token[:token]}"
      get :private_api
      expect(JSON.parse(response.body)["status"]).to eq("success")
    end

    it "Gets no success in private api method without authrztn" do
      get :private_api
      expect(JSON.parse(response.body)["error"]).to eq('Not Authorized')
    end
  end
end