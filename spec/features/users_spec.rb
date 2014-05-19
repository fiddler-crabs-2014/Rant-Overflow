require "spec_helper"

describe "User", js: true do
  let!(:rantone) { create :rant }
  let!(:ranttwo) { create :rant }

  describe "A user can create an account" do
    context "with valid account information" do
      it "can click on sign-up" do
        visit root_path
        click_on "Sign Up"
        expect(page).to have_content "Password confirm"
      end
      it "can fill out and submit the form" do
        visit root_path
        click_on "Sign Up"
        fill_in "Email", :with => "sadface@keaty.com"
        fill_in "Password", :with => "Something"
        fill_in "Password confirm", :with => "Something"
        click_on "Create User"
        expect(page).to have_content "sadface@keaty.com"
      end
      it "creates a user" do
        visit root_path
        click_on "Sign Up"
        fill_in "Email", :with => "happytimes@keaty.com"
        fill_in "Password", :with => "Something"
        fill_in "Password confirm", :with => "Something"
        expect{click_on "Create User"}.to change{ User.count }.by(1)
        # expect(page).to have_content "happytimes@keaty.com"
      end
    end
    # context "with invalid account information" do
    #   it "redirects back to create account page" do

    #   end
    # end
  end
end
