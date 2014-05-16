require "spec_helper"
describe ResponsesController do
  let!(:rant) { Rant.create(title: "Hehe", body: "test body") }
  let!(:testresponse) { Response.create(body: "Nice Rant!") }

  context '#create' do
    it "creates a response with valid params" do
      expect{
        post :create, rant_id: rant.id, response: { body: testresponse.body }
      }.to change { Response.count }.by(1)
    end

    it "doesn't create a response with invalid params" do
      expect{
        post :create, rant_id: rant.id, response: { body: nil }
        expect(response.status).to eq 422
      }.to_not change { Response.count }
    end
  end
end
