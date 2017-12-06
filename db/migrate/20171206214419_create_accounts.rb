class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string   :account_number, limit: 14, null: false
      t.string   :currency,       limit: 3,  null: false

      t.integer  :balance, default: 0, null: false
      
      t.integer  :montly_maintenance_cost, default: 0, null: false

      t.datetime :cancellation_date

      t.references :client, foreign_key: true, null: false

      t.timestamps
    end
  end
end
