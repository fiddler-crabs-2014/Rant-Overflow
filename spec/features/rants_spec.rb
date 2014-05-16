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

  describe "User can create a rant" do
  end

  describe "User can see rants" do
    describe "when user is not logged in" do
    end

    describe "when user is logged in" do
    end
  end
end

