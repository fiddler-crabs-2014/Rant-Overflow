<<<<<<< HEAD
require "spec_helper"
describe Response do
  let!(:response) { Response.create(body: "content content")}
  let!(:rant) { Rant.create(title: "hi", body: "RANTING", responses: [response]) }

  describe "User can see all responses of a rant" do
    it "by visiting a rant page" do
      visit rant_path(rant)
      expect(page).to have_content response.body
    end
  end

  describe "User can create a response" do
    context "with valid body" do
      it "response body will be appended to the page" do
        visit rant_path(rant)
        fill_in "Body", with: "Write Something"
        click_on "Respond"
        expect(page).to have_content "Write Something"
      end
    end

    context "with invalid body" do
      it "shows error message" do
        visit rant_path(rant)
        fill_in "Body", with: ""
        click_on "Respond"
        expect(page).to have_content "Response body cannot be blank"
      end
    end

  end

end
=======
# require "spec_helper"

# describe "Rants", js: true do
#   let!(:rant) { Rant.new(title: "hi", body: "RANTING", responses: [Response.new(body: "comments comments")]) }
#   describe "A user" do
#     it "should show comment" do
#       rant = Rant.create(title: "hi", body: "RANTING", responses: [Response.create(body: "comments comments")])
#       visit rant_path(rant)
#       expect(page).to have_content "comments comments"
#     end
#   end
# end
>>>>>>> 03278895afba8df6981416144f099f88755e5f8b
