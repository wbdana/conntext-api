class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :record_id
      t.string :username
      t.string :content

      t.timestamps
    end
  end
end
