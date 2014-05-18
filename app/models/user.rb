class User < ActiveRecord::Base
  validates :email, presence: true,
                      uniqueness: true,
                      format: { with: /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i,
                                message: "must be a valid email"}
  validates :password, :presence => true
  has_many :rants
  has_many :responses


  def self.authenticate(email, password)
    this_user = User.where(email: email).first
    return nil if this_user.nil?

    if this_user.password == password
      return this_user
    else
      return nil
    end
  end
end
