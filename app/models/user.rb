# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  password_digest   :string
#  profile_image_url :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  has_many :records_users
  has_many :records, through: :records_users
  has_many :created_records, foreign_key: :owner_id, class_name: "Record"
  validates: :email, uniqueness: true
end
