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

  describe "User can edit a response" do
    context "with valid body" do
      it "should update the response with new body" do
        visit rant_path(rant)
        click_on "Edit Response"
        fill_in "Body", with: "New Body"
        click_on "Submit"
        expect(page).to have_content "New Body"
      end
    end

    context "with invalid body" do
      it "should show the original body" do
        pending
      end
    end
  end
end
