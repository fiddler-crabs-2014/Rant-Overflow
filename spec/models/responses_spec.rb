require "spec_helper"
describe Response do
  let!(:response) { Response.new(body: "comments comments") }
  it { should respond_to :body }
end
