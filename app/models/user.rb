class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :password, :password_confirmation

  validates :email, presence: true, uniqueness: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :password, presence: true, length: 6..20, on: :create

  has_secure_password
end
