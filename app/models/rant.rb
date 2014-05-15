class Rant < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
  has_many :responses
  belongs_to :user
end
