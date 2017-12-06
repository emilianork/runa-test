class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string    :name,                limit: 50, null: false
      t.string    :paternal_last_name,  limit: 50, null: false
      t.string    :maternal_last_name,  limit: 50, null: false
      t.string    :gender,              limit: 1,  null: false
      t.date      :birthday,                       null: false
      t.string    :document_type,       limit: 50, null: false
      t.string    :document_number,     limit: 50, null: false
      t.datetime  :affiliation_date,    default: 'CURRENT_DATETIME', null: false

      t.timestamps
    end

    add_index :clients, %i[document_type document_number], unique: true
  end
end
