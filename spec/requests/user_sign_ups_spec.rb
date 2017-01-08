require 'rails_helper'

RSpec.describe "UserSignUps", type: :request do
  describe "User click sign up link" do
    it "redirect_to sign up page" do
      visit root_path
      click_link "Sign up"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password confirmation")
    end

    it "fills up the form with valid input" do
      email = "ben@steelers.com"
      sign_up_with("big ben", email, "hahaha")
      expect(page).to have_content(email)
    end

    it "fills up the form with invalid input" do
      sign_up_with("big ben", "hahaha", "123")
      expect(page).to have_content("Sign Up")
    end
  end

end
