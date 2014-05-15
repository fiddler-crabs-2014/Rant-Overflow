class Response < ActiveRecord::Base
  validates :body, :presence => true
  belongs_to :rant
  belongs_to :user
end
