# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_171_206_214_419) do
  create_table 'accounts', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'account_number', limit: 14, null: false
    t.string 'currency', limit: 3, null: false
    t.integer 'balance', default: 0, null: false
    t.integer 'monthly_maintenance_cost', default: 0, null: false
    t.datetime 'cancellation_date'
    t.bigint 'client_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_accounts_on_client_id'
  end

  create_table 'addresses', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'street1', limit: 50, null: false
    t.string 'street2', limit: 50, null: false
    t.string 'street3', limit: 50
    t.string 'city', limit: 50, null: false
    t.string 'state', limit: 50, null: false
    t.bigint 'client_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_addresses_on_client_id'
  end

  create_table 'clients', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', limit: 50
    t.string 'paternal_last_name', limit: 50
    t.string 'maternal_last_name', limit: 50
    t.string 'gender', limit: 1
    t.date 'birthday'
    t.string 'document_type', limit: 50
    t.string 'document_number', limit: 50
    t.date 'affiliation_date'
    t.string 'curp', limit: 18
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[document_type document_number], name: 'index_clients_on_document_type_and_document_number', unique: true
  end

  add_foreign_key 'accounts', 'clients'
  add_foreign_key 'addresses', 'clients'
end
