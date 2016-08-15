require 'pg'
require 'active_record'

# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "glossary"
)

# use Rack::Flash
class Term < ActiveRecord::Base
  has_one :category
end

class Category < ActiveRecord::Base
  has_many :terms
end
