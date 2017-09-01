class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :name
      t.string :language
      t.string :content

      t.timestamps
    end
  end
end
