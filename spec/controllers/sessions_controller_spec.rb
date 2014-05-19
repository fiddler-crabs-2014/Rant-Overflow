require 'spec_helper'

describe SessionsController do
  let(:user) {create :user}

  before do
    controller.stub(current_user: user)
    # controller.sessions[:user_id] = user.id
  end

  describe "#new" do
    it "renders successfully" do
      get :new
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    pending
    # it "puts the user id in the sessions hash" do
    #   expect(response).to eq user.id
    # end
  end

  describe "#destroy" do
    pending
    # it "clears the user id in the sessions hash" do
    #   controller.stub(current_user: nil)
    #   expect(response.session).to eq nil
    # end
  end
end
