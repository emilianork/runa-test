require 'encryptor/string'
String.include Encryptor::String

key = Rails.application.secrets[:cypher][:key]
iv  = Rails.application.secrets[:cypher][:iv]

Encryptor.default_options.merge!(algorithm: 'aes-256-cbc', key: key, iv: iv)
