require "spec_helper"
describe ResponsesController do
  let(:rant) { Rant.create(title: "Hehe", body: "test body") }
  let!(:testresponse) { Response.create(body: "Nice Rant!") }

  describe '#create' do
    context "when valid params are passed" do
      it "creates a response"
        expect{
          post :create, rant_id: rant.id, response: { body: testresponse.body }
        }.to change { Response.count }.by(1)
      end

      it "creates a response with the correct attributes"
      it "redirects"
    end

    context "when invlaid params are passed" do
      it "doesn't create a response" do
        expect{
          post :create, rant_id: rant.id, response: { body: nil }
        }.to_not change { Response.count }
      end

      it "returns an 422" do
        post :create, rant_id: rant.id, response: { body: nil }
        expect(response.status).to eq 422
      end

      it "creates the response variable" do
        post :create, rant_id: rant.id
        controller.assigns(:response)
      end

      it "renders text"

      it "errors when rant_id isn't passed"
    end
  end
end
