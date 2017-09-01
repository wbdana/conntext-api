class CreateRecordsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :records_users do |t|
      t.integer :record_id
      t.integer :user_id

      t.timestamps
    end
  end
end
