require 'sqlite3'
require 'active_record'

# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "glossary.db"
)

# use Rack::Flash
class Term < ActiveRecord::Base
  has_one :category
end

class Category < ActiveRecord::Base
  has_many :terms
end
