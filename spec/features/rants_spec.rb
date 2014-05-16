require "spec_helper"
require "debugger"

describe "Rant", js: true do
  #let!(:user) { User.create(email: "adam@gmail.com", password: "kidfjs")}
  #let!(:rant) { Rant.create(title: "hi", body: "RANTING", user: user) }
  describe "User can view all the rants" do
    it "should show comment" do
      user = User.create(email: "adam@gmail.com", password: "kidfjs")
      rant = Rant.create(title: "hi", body: "RANTING", user: user)
      rant.responses << Response.create(body: "comments comments")


      visit rant_path(rant)#'/rants/' + rant.id.to_s
      expect(page).to have_content "comments comments"
    end
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
      find_button('Create Rant').click
      expect( Rant.count ).to_not change
    end
  end
end


# as a user i want to be able to create a rant
# as a user i want to be able to view a rant
# cannot create a rant if you're not logged in
