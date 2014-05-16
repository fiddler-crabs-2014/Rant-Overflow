require "spec_helper"
require "debugger"

describe "Rant", js: true do

  let(:user) { User.create(email: "adam@gmail.com", password: "kidfjs")}
  let!(:rant) { Rant.create(title: "hi", body: "RANTING", user: user) }

  describe "User can view rants" do

    it "on the landing page" do
      visit root_path
      expect(page).to have_content "RANTING"
    end

    it "on the individual rant pages" do
      visit rant_path(rant)
      expect(page).to have_content "RANTING"
    end

  end

  describe "User can create a rant" do
    it "creates a rant with valid input" do
      # session[:user_id] = user.id
      visit new_rant_path(rant)
      fill_in "Title", :with => "Test Rant 1"
      fill_in "Body", :with => "rant rant rant"
      expect { click_on "Create Rant" }.to change{Rant.count}.by(1)
    end

    # it "sends an error with invalid input" do
    #   rant.responses << Response.create(body: "comments comments")

    #   visit rant_path(rant)
    #   expect(page).to have_content "comments comments"
    # end

  end
end

