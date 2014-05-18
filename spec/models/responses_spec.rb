require "spec_helper"
describe Response do
  let!(:response) { Response.new(body: "comments comments") }
  it { should respond_to :body }

  context "validations" do
    it { should validate_presence_of :body }
  end

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :rant }
  end
end
