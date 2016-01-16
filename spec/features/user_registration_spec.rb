# encoding: utf-8
require "spec_helper"

describe "User registration" do
  let(:new_user) { User.where(email: "onishenko-vitalii@example.com").last }
  let(:sent_email) { ActionMailer::Base.deliveries.reverse.find { |m| m.to = ["onishenko-vitalii@example.com"] } }
  let(:confirmation_link) { sent_email.body.to_s.scan(/\/users\/confirmation[^"]+/).first }

  specify "user creates new account, confirms email and sign in" do
    visit "/?locale=uk"
    click_link "Ввійти"
    click_link "Реєстрація"
    fill_in "Email", with: "onishenko-vitalii@example.com"
    fill_in "Пароль", with: "secret1234"
    fill_in "Підтвердження пароля", with: "secret1234"
    fill_in "Ім'я та прізвище", with: "Виталий Онищенко"
    fill_in 'Перший номер телефону', with: "(098)765-43-21"
    check "Умови користування сервісом"
    click_button "Реєстрація"
    expect(page).to have_content "Ви успішно зареєструвалися. " \
      "Але, Ви не можете увійти через те, що ваш обліковий запис не підтверджено."

    visit confirmation_link

    click_link "Ввійти"
    fill_in "Email", with: "onishenko-vitalii@example.com"
    fill_in "Пароль", with: "secret1234"
    click_button "Ввійти"

    expect(page).to have_content "Вхід успішний."
    expect(page).to have_content "Виталий Онищенко"
    expect(new_user).to be_confirmed
  end
end
