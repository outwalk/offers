# encoding: utf-8
require "spec_helper"

describe "Profile editing" do
  let(:user) { create(:user, name: "Остап", password: "secret1234") }
  let(:sent_email) { ActionMailer::Base.deliveries.reverse.find { |m| m.to = ["ostap@example.com"] } }
  let(:confirmation_link) { sent_email.body.to_s.scan(/\/users\/confirmation[^"]+/).first }

  specify "user sign in and changes his name and phone number" do
    login_user(user)

    click_link "Остап"
    click_link "Обліковий запис"

    fill_in "Ім'я та прізвище", with: "Остап Вишня"
    fill_in "Перший номер телефону", with: "(091)765-43-34"
    fill_in "Поточний пароль", with: "secret1234"

    click_button "Оновити"

    expect(page).to have_content "Ви успішно оновили свій обліковий запис."

    user.reload
    expect(user.name).to eq "Остап Вишня"
    expect(user.phone_first).to eq "+380917654334"
  end

  specify "user sign in changes his email and confirms it" do
    login_user(user)

    click_link "Остап"
    click_link "Обліковий запис"

    fill_in "Email", with: "ostap@example.com"
    fill_in "Поточний пароль", with: "secret1234"

    click_button "Оновити"

    expect(page).to have_content "Ви успішно оновили свій обліковий запис, але ми маємо перевірити Ваш email. " \
      "Будь ласка, перевірте Ваш email та перейдіть за посиланням для того, щоб підтвердити Ваш email."

    visit confirmation_link

    expect(page).to have_content "Ваш обліковий запис було успішно підтверджено."

    user.reload
    expect(user.email).to eq "ostap@example.com"
    expect(user).to be_confirmed
  end
end
