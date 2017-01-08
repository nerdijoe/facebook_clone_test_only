module Requests
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit new_user_path
      fill_in "Name", with: name
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password

      click_button "Create User"
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end
