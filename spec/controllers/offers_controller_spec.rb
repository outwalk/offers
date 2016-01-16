require 'spec_helper'

describe OffersController, type: :controller do
  login_user
  let(:region) { create(:region) }
  let(:district) { create(:district, region: region) }
  let(:locality) { create(:locality, region: region, district: district) }
  let!(:offer) { create(:offer, offer_type: 'sale') }

  let(:valid_attributes) do
    {
      offer_type: 'sale',
      category: Offer::CATEGORIES.sample,
      region_id: region.id,
      district_id: district.id,
      locality_id: locality.id,
      price: 40000,
      price_currency: 'USD',
      phone_first: '+380449876543'
    }
  end

  let(:invalid_attributes) { { offer_type: 'buy', category: 'book', phone_first: '' } }

  describe "GET #index" do
    it "assigns all offers as @offers" do
      get :index
      expect(assigns(:offers)).to eq([offer])
    end
  end

  describe "GET #show" do
    it "assigns the requested offer as @offer" do
      get :show, id: offer.to_param
      expect(assigns(:offer)).to eq(offer)
    end
  end

  describe "GET #new" do
    it "assigns a new offer as @offer" do
      get :new
      expect(assigns(:offer)).to be_a_new(Offer)
    end
  end

  describe "GET #edit" do
    it "assigns the requested offer as @offer" do
      get :edit, id: offer.to_param
      expect(assigns(:offer)).to eq(offer)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, offer: valid_attributes
        }.to change(Offer, :count).by(1)
      end

      it "assigns a newly created offer as @offer" do
        post :create, offer: valid_attributes
        expect(assigns(:offer)).to be_a(Offer)
        expect(assigns(:offer)).to be_persisted
      end

      it "redirects to the created offer" do
        post :create, offer: valid_attributes
        expect(response).to redirect_to(Offer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        post :create, offer: invalid_attributes
        expect(assigns(:offer)).to be_a_new(Offer)
      end

      it "re-renders the 'new' template" do
        post :create, offer: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { price: 820000, price_currency: 'UAH' } }

      it "updates the requested offer" do
        put :update, id: offer.to_param, offer: new_attributes
        offer.reload
        expect(offer.price).to eq(820000)
        expect(offer.price_currency).to eq('UAH')
      end

      it "assigns the requested offer as @offer" do
        put :update, id: offer.to_param, offer: valid_attributes
        expect(assigns(:offer)).to eq(offer)
      end

      it "redirects to the offer" do
        put :update, id: offer.to_param, offer: valid_attributes
        expect(response).to redirect_to(offer)
      end
    end

    context "with invalid params" do
      it "assigns the offer as @offer" do
        put :update, id: offer.to_param, offer: invalid_attributes
        expect(assigns(:offer)).to eq(offer)
      end

      it "re-renders the 'edit' template" do
        put :update, id: offer.to_param, offer: invalid_attributes
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested offer" do
      expect {
        delete :destroy, id: offer.to_param
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      delete :destroy, id: offer.to_param
      expect(response).to redirect_to(offers_url)
    end
  end
end
