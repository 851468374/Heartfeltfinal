class User < ApplicationRecord
  has_many :tasks
  attr_accessor :stuid,
                :name,
                :age,
                :school,
                :currterm,
                :email,
                :tele
end
