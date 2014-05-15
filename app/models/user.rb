class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  has_many :rants
  has_many :responses
end
