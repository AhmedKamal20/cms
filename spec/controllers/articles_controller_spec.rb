require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET index" do
    it "list articles" do
      article = create(:article)
      get :index

      expect(response.body).to eq([article.attributes].to_json)
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "show article data" do
      article = create(:article)
      get :show, params: { id: article.id }

      expect(response.body).to eq(article.attributes.to_json)
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "create new article" do
      user = create(:user)
      article = attributes_for(:article)
      article[:user_id] = user.id
      post :create, params: article

      expect(JSON.parse(response.body)["title"]).to eq(article[:title])
      expect(JSON.parse(response.body)["description"]).to eq(article[:description])
      expect(JSON.parse(response.body)["user_id"]).to eq(user.id)
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH update" do
    it "update article data" do
      article = create(:article)
      new_title = Faker::Lorem.sentence
      patch :update, params: { id: article.id, title: new_title }

      expect(JSON.parse(response.body)["title"]).to eq(new_title)
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    it "update article data" do
      article = create(:article)
      delete :destroy, params: { id: article.id }

      expect(response.status).to eq(204)
    end
  end
end
