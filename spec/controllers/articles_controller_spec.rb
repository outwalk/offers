require 'spec_helper'

describe ArticlesController, type: :controller do
  let!(:article) { create(:article, language: 'uk') }

  describe "GET #index" do
    it "assigns all articles as @articles" do
      get :index
      expect(assigns(:articles)).to eq([article])
    end

    context "search" do
      let!(:economy_article) { create(:article, language: 'uk', category: 'Energy', section: 'The Economy') }

      it "assigns all articles that matches filter as @articles" do
        get :index, category_eq: 'Energy', section_eq: 'The Economy'
        expect(assigns(:articles)).to eq([economy_article])
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested article as @article" do
      get :show, id: article.to_param
      expect(assigns(:article)).to eq(article)
    end

    context "translation not available" do
      it "notifies if translation not available" do
        get :show, id: article.to_param, locale: 'es'
        expect(flash.now[:notice]).to eq 'es translation not available'
      end
    end
  end
end
