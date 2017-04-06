require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_ad) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(15)) }


  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisement)).to eq([my_ad])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @advertisement" do
      get :show, {id: my_ad.id}
      # #18
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "AD create" do
    it "increases the number of Ads by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Advertisement,:count).by(1)
    end

    it "increases the number of Posts not to change" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(0)
    end

    it "assigns the new post to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new ad" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
