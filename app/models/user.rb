class User < ApplicationRecord
  has_secure_password
  has_many :records_users
  has_many :records, through: :records_users
end
