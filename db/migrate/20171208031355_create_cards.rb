class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :number, limit: 16, null: false
      t.string :exp_month, limit: 2, null: false
      t.string :exp_year, limit: 4, null: false
      t.string :cvv, limit: 3, null: false
      t.string :pin, limit: 50, null: false

      t.boolean :blocked, null: false, default: false

      t.timestamps
    end

    add_reference(:cards, :usd_account,
                  foreign_key: { to_table: :accounts }, index: true)

    add_reference(:cards, :mxn_account,
                  foreign_key: { to_table: :accounts }, index: true)

    add_index :cards, :numbr, unique: true
  end
end
