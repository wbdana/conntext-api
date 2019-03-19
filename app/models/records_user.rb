# == Schema Information
#
# Table name: records_users
#
#  id         :integer          not null, primary key
#  record_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecordsUser < ApplicationRecord
  belongs_to :user
  belongs_to :record
  validates_uniqueness_of :user_id, scope: :record_id
end
