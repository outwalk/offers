# encoding: utf-8

module LoginHelper
  def login_user(user)
    visit "/?locale=uk"
    click_link "Ввійти"
    fill_in "Email", with: user.email
    fill_in "Пароль", with: user.password
    click_button "Ввійти"
  end
end
