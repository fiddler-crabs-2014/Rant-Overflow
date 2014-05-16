require "spec_helper"
describe Response do
  let!(:rant) { Rant.create(title: "hi", body: "RANTING", responses: [Response.create(body: "comments comments")]) }
  describe "A user" do
    it "should show comment" do
      visit rant_path(rant)
      expect(page).to have_content "comments comments"
    end
  end
end
