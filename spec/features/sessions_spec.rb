require 'spec_helper'

describe "Sessions" do
  let(:user){ create :user }

  describe "log in" do
    context "with a valid name and a password" do
      it "should be able to start a new session at log in" do
        visit new_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign In"
        expect(page).to have_content "Sign in successful!"
      end
    end
    context "with an invalid name and/or password" do
      it "should not be able to start a new session" do
        visit new_session_path
        fill_in "Email", with: "joeschmoe"
        fill_in "Password", with: "1"
        click_button "Sign In"
        expect(page).to have_content "Wrong username or password!"
      end
    end
  end

end