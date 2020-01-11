class Signin < ApplicationRecord
  has_one :user
  has_secure_password
  attr_accessor :id
end
