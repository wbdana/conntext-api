class Record < ApplicationRecord
  has_many :records_users
  has_many :users, through: :records_users
end
