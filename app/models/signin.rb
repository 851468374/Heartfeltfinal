class Signin < ApplicationRecord
  has_secure_password
  attr_accessor :id,
                :stuid,
                :authority
end
