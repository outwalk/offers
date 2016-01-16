module DeviseControllerMacros
  def login_user(options = {})
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user, options)
      sign_in :user, @user
    end
  end
end
