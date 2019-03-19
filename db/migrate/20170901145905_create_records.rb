class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :name
      t.integer :owner_id
      t.string :language
      t.string :content

      t.timestamps
    end
  end
end
