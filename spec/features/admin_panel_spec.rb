# encoding: utf-8
require 'spec_helper'

describe 'Admin Panel' do
  include_context 'Initial Data'
  let(:admin) { create(:user, password: 'secret1234', admin: true) }

  context 'Non admin user' do
    let(:user) { create(:user, password: 'secret1234') }

    it 'redirects non-admin user from admin panel' do
      login_user(user)

      visit '/admin'
      expect(current_path).to eq '/users/edit'
      expect(page).to have_content 'Unauthorized Access!'
    end
  end

  describe 'Region editing' do
    it 'admin searches regions and looks at selected' do
      login_user(admin)

      visit '/admin'
      click_link 'Regions'

      expect(page).to have_content 'Київська обл.'
      expect(page).to have_content 'Сумська обл.'

      first('.view_link.member_link').click

      expect(page).to have_content 'kyivska'
      expect(page).to have_content 'Київська обл.'
      expect(page).to have_content 'Киевская обл.'
      expect(page).to have_content 'Kyiv (Kiev) Oblast'
      expect(page).to have_content '50.0529506'
      expect(page).to have_content '30.7667133'
    end
  end

  describe 'District editing' do
    it 'admin searches districts and edits selected' do
      login_user(admin)

      visit '/admin'
      click_link 'Districts'

      fill_in 'Name', with: 'Сумський'
      click_button 'Фільтрувати'

      click_link 'Змінити'
      fill_in 'District name uk', with: 'Сумський район'
      click_button 'Update District'

      expect(page).to have_content 'District було успішно оновлено.'
      expect(page).to have_content 'District детальніше'
      expect(page).to have_content 'Сумський район'

      sumy_raion.reload
      expect(sumy_raion.district_name_uk).to eq 'Сумський район'
    end
  end

  describe 'Locality managing' do
    let(:locality) { Locality.where(name_uk: 'Жуляни').take }

    specify "admin sign in, searches for specific locality and changes its category", js: true do
      login_user(admin)

      visit '/admin'
      click_link 'Localities'

      select 'Київська обл.', from: 'Region'
      select 'Київ', from: 'District'
      fill_in 'Name', with: 'Жуляни'
      click_button 'Фільтрувати'

      click_link 'Змінити'

      select 'suburb', from: 'Category'
      click_button 'Update Locality'

      expect(page).to have_content 'Locality було успішно оновлено.'
      expect(page).to have_content 'Locality детальніше'
      expect(page).to have_content 'suburb'

      expect(locality).not_to be_sub_locality
      expect(locality.category).to eq 'suburb'
    end

    specify "admin searches localities by phone code and sees column 'Phone code'" do
      login_user(admin)

      visit '/admin'
      click_link 'Localities'

      fill_in 'Phone code', with: '542'
      click_button 'Фільтрувати'

      expect(page).to have_content '542'
      expect(page).to have_content 'Суми'
    end

    specify "admin creates new locality", js: true do
      login_user(admin)

      visit '/admin'
      click_link 'Localities'
      click_link 'Створити Locality'

      select 'Сумська обл.', from: 'Region'

      select 'Сумський / Суми', from: 'District'
      select 'district', from: 'Category'
      fill_in 'Name uk', with: '10-й мікрорайон'
      fill_in 'Name ru', with: '10-й микрорайон'
      check 'Non admin'
      click_button 'Створити'

      expect(page).to have_content 'Locality було успішно створено.'
      expect(page).to have_content '10-й мікрорайон'
    end
  end

  describe 'User editing' do
    let!(:user) { create(:user, email: 'oleksii@example.com', confirmed_at: nil) }

    specify "admin manually confirms user's email" do
      expect(user).not_to be_confirmed
      login_user(admin)

      visit '/admin'
      click_link 'Користувачі'

      fill_in 'Email', with: 'oleksii@example.com'
      click_button 'Фільтрувати'
      click_link 'Змінити'

      fill_in 'Email підтверджений', with: '2015-09-10'
      click_button 'Update Користувач'

      expect(page).to have_content 'Email підтверджений 10 вересня 2015'

      user.reload
      expect(user).to be_confirmed
    end
  end

  describe 'Agency managing' do
    let!(:agency) { create(:agency, name: 'Альфа Нерухом') }

    specify "admin edits agency's details" do
      login_user(admin)

      visit '/admin'
      click_link 'Agencies'

      fill_in 'Name', with: 'Альфа Нерухом'
      click_button 'Фільтрувати'
      click_link 'Змінити'

      fill_in 'Full name', with: 'Агенство нерухомості "Альфа Нерухом"'
      click_button 'Update Agency'

      expect(page).to have_content 'Full Name Агенство нерухомості "Альфа Нерухом"'
      agency.reload
      expect(agency.full_name).to eq 'Агенство нерухомості "Альфа Нерухом"'
    end
  end

  describe 'Articles editing' do
    let!(:article_uk) { create(:article, language: 'uk', title: 'Що очікує Лівію?') }
    let!(:article_ru) { create(:article, language: 'ru', title: 'Что ожидает Ливию?') }

    specify "admin edits articles in different languages" do
      login_user(admin)

      visit '/admin'
      click_link 'Articles'

      expect(page).to have_content 'Що очікує Лівію?'
      expect(page).not_to have_content 'Что ожидает Ливию?'

      click_link 'Languages'
      click_link 'Русский'

      expect(page).to have_content 'Что ожидает Ливию?'
      click_link 'Изменить'

      fill_in 'article[body]', with: 'Lorem ipsum'
      click_button 'Update Article'

      expect(page).to have_content 'Lorem ipsum'
      article_ru.reload
      expect(article_ru.body).to eq 'Lorem ipsum'
    end
  end
end
