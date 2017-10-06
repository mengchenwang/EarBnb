require 'data_mapper'
require 'dm-timestamps'
require 'dm-postgres-adapter'

require_relative 'models/property'
require_relative 'models/user'
require_relative 'models/message'
require_relative 'models/conversation'

local_source = "postgres://localhost/earbnb_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_source)
DataMapper.finalize
DataMapper.auto_upgrade!
