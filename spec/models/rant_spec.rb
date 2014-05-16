require "spec_helper"

describe Rant do
  context "Attibutes" do
    it { should respond_to :title }
    it { should respond_to :body }
    it { should respond_to :view_count }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
    it { should respond_to :user }
    it { should respond_to :responses }
  end

  it "should save a rant to the database" do
    my_rant = Rant.create(title: 'Title', body: 'This is the body of the rant')
    my_rant.title should eq 'Title'
    my_rant.body should eq 'This is the body of the rant'
  end

  it "default view count should = 0" do
    my_rant = Rant.new
    my_rant.view_count.should eq 0
  end

  it "should have a user associated with a rant"

  it "should require a user to create a rant"

end