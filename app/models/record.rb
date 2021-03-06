# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  name       :string
#  owner_id   :integer
#  language   :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ApplicationRecord
  has_many :records_users
  has_many :users, through: :records_users
  has_many :messages
  belongs_to :owner, class_name: "User"
end
