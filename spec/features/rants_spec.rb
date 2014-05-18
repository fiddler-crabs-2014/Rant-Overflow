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

  describe "The User" do
    it "can create a new rant and see it on the following show page" do
      visit new_rant_path
      fill_in "Title", :with => "This is my problem..."
      fill_in "Body", :with => "george bushs paintings suck"
      find_button('Create Rant').click
      expect(page).to have_content("This is my problem...")
    end


    it "cannot create a new rant with invalid attributes" do
      visit new_rant_path
      fill_in "Title", :with => ""
      fill_in "Body", :with => ""
      expect { find_button('Create Rant').click }.to change {Rant.count}.by(0)
    end
  end
end


# as a user i want to be able to create a rant
# as a user i want to be able to view a rant
# cannot create a rant if you're not logged in
