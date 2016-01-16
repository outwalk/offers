require 'spec_helper'

describe SupportController, type: :controller do
  let!(:support) { create(:support) }
  let!(:support_ru) { create(:support, language: 'ru') }

  describe 'GET #index' do
    it 'assigns all supports in current locale as @supports' do
      get :index
      expect(assigns(:supports)).to eq([support])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested support as @support' do
      get :show, slug: support.to_param
      expect(assigns(:support)).to eq(support)
    end
  end
end
