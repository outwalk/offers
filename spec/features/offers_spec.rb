# encoding: utf-8
require 'spec_helper'

describe 'Offers Browsing and Managing' do
  include_context 'Initial Data'
  include_context 'Offer'
  let(:new_offer) { Offer.last }

  specify 'visitor can browse offers' do
    visit '/?locale=uk'

    expect(page).to have_content '17 000,00 USD'
    expect(page).to have_content 'Срочно продам 2-комнатную квартиру! Возможен торг! т.0508833997'
    expect(page).to have_content 'Дніпропетровська обл., Першотравенськ 43.0/27.0/7.0, 5/5'
    expect(page).to have_content 'Капитальный ремонт, пластиковые балкон и окна'
  end

  specify 'visitor can browse second page of the index page' do
    create_list(:offer, 25)
    offer.update_column(:updated_at, 2.minutes.ago)
    visit '/?locale=uk'

    expect(page).not_to have_content 'Дніпропетровська обл., Першотравенськ 43.0/27.0/7.0, 5/5'

    click_link '2'

    expect(page).to have_content 'Дніпропетровська обл., Першотравенськ 43.0/27.0/7.0, 5/5'
  end

  specify 'visitor can select from the list and view specific offer' do
    visit '/?locale=uk'
    click_link 'Срочно продам 2-комнатную квартиру! Возможен торг! т.0508833997'

    expect(page).to have_content 'Загальна кількість кімнат у квартирі чи домі'
    expect(page).to have_content '2'
    expect(page).to have_content 'Загальна площа'
    expect(page).to have_content '43.0'
    expect(page).to have_content 'Ціна'
    expect(page).to have_content '17000'
  end

  specify 'registered logged in user can create new offer with turned off JavaScript' do
    login_user(dougal)
    visit '/?locale=uk'
    click_link 'Новий'
    select 'продаж', from: 'offer[offer_type]'
    select 'квартира', from: 'offer[category]'
    select 'Київська обл.', from: 'offer[region_id]'
    fill_in 'Ціна', with: 35000
    select '$', from: 'offer[price_currency]'
    click_button 'Create Оголошення'
    select 'Київ', from: 'offer[district_id]'
    click_button 'Create Оголошення'
    select 'Голосіївський', from: 'offer[locality_id]'
    click_button 'Create Оголошення'

    expect(page).to have_content 'Offer was successfully created.'
    expect(new_offer.price).to eq 35000
  end

  specify 'registered logged in user can create new offer', js: true do
    login_user(dougal)
    visit '/?locale=uk'
    click_link 'Новий'
    select 'продаж', from: 'offer[offer_type]'
    select 'квартира', from: 'offer[category]'
    select 'Київська обл.', from: 'offer[region_id]'
    select 'Київ', from: 'offer[district_id]'
    select 'Голосіївський', from: 'offer[locality_id]'
    fill_in 'Ціна', with: 35000
    select '$', from: 'offer[price_currency]'
    click_button 'Create Оголошення'

    expect(page).to have_content 'Offer was successfully created.'
    expect(new_offer.price).to eq 35000
  end
end
