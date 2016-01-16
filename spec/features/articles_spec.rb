# encoding: utf-8
require "spec_helper"

describe "Browsing Articles" do
  include_context 'Articles'

  specify "visitor looks at the home page and selects one article to read" do
    visit '/articles?locale=uk'

    expect(page).to have_css 'a', text: about_libya.title
    expect(page).to have_css 'a', text: about_tripoli.title
    expect(page).to have_css 'a', text: about_opec.title
    expect(page).to have_css 'a', text: about_oil.title

    click_link about_libya.title

    expect(current_url).to eq "http://www.example.com/articles/#{about_libya.id}?locale=uk"
    expect(page).to have_css 'h1.title', text: about_libya.title
    expect(page).to have_content 'Одне можна сказати напевно - міжнародні нафтові компанії будуть пакувати польоти в Тріполі'
    expect(page).to have_css 'a', text: about_libya.category
    expect(page).to have_css 'a', text: about_libya.section
  end

  specify "visitor chooses a category from the breadcrumbs" do
    visit "/articles/#{about_libya.id}?locale=uk"

    within '.col-md-9' do
      click_link about_libya.category
    end

    expect(page).to have_css 'a', text: about_libya.title
    expect(page).to have_css 'a', text: about_tripoli.title
    expect(page).to have_css 'a', text: about_opec.title
    expect(page).not_to have_css 'a', text: about_oil.title
  end

  specify "visitor chooses a section from the breadcrumbs" do
    visit "/articles/#{about_libya.id}?locale=uk"

    click_link about_libya.section

    expect(page).to have_css 'a', text: about_libya.title
    expect(page).to have_css 'a', text: about_tripoli.title
    expect(page).not_to have_css 'a', text: about_opec.title
    expect(page).not_to have_css 'a', text: about_oil.title
  end

  specify "visitor uses a full-text search and selects one of the articles", js: true do
    visit '/articles?locale=uk'
    fill_in 'q', with: 'Брюссель і Вашингтон'
    find('.glyphicon-search').click

    expect(page).to have_css 'a', text: about_libya.title
    expect(page).not_to have_css 'a', text: about_tripoli.title
    expect(page).not_to have_css 'a', text: about_opec.title
    expect(page).not_to have_css 'a', text: about_oil.title
  end

  specify "user changes language and selects one article to read", js: true do
    visit '/articles?locale=ru'

    expect(page).to have_css 'a', text: about_libya_ru.title
    expect(page).not_to have_css 'a', text: about_libya.title

    first('.col-md-9').click_link about_libya_ru.title

    expect(page).to have_css 'h1.title', text: about_libya_ru.title
    expect(page).to have_content 'Ливийская экономика зависит прежде всего от доходов нефтяного сектора'
    expect(page).to have_css 'a', text: about_libya_ru.category
    expect(page).to have_css 'a', text: about_libya_ru.section
  end

  context "Pagination" do
    before { create_list(:article, 11) }

    specify "visitor goes to the second page" do
      visit '/articles?locale=uk'
      click_link '2'

      expect(page).not_to have_css 'a', text: about_libya.title
      expect(page).not_to have_css 'a', text: about_tripoli.title
      expect(page).not_to have_css 'a', text: about_opec.title
      expect(page).not_to have_css 'a', text: about_oil.title
      expect(page).to have_content article_from_the_second_page.title
    end
  end
end
