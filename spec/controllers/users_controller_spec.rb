require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    it "list users" do
      user = create(:user)
      serializer = UserSerializer.new(user)
      get :index

      expect(JSON.parse(response.body).count).to eq(1)
      expect(JSON.parse(response.body)).to eq([JSON.parse(serializer.to_json)])
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "show user data" do
      user = create(:user)
      serializer = UserSerializer.new(user)
      get :show, params: { id: user.id }

      expect(response.body).to eq(serializer.to_json)
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "create new user" do
      user = attributes_for(:user)
      post :create, params: user

      expect(JSON.parse(response.body)["name"]).to eq(user[:name])
      expect(JSON.parse(response.body)["email"]).to eq(user[:email])
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH update" do
    it "update user data" do
      user = create(:user)
      new_name = Faker::Name.name
      patch :update, params: { id: user.id, name: new_name }

      expect(JSON.parse(response.body)["name"]).to eq(new_name)
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    it "update user data" do
      user = create(:user)
      delete :destroy, params: { id: user.id }

      expect(response.status).to eq(204)
    end
  end
end
