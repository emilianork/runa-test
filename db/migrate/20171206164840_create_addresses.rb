class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street1, limit: 100, null: false
      t.string :street2, limit: 100, null: false
      t.string :street3, limit: 100
      t.string :city,    limit: 100, null: false
      t.string :state,   limit: 100, null: false

      t.references :client, foreign_key: true, null: false

      t.timestamps
    end
  end
end
