class Signin < ApplicationRecord
  has_one :user
  has_secure_password
  attr_accessor :id,
                :stuid,
                :authority
end
