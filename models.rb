require 'pg'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
if ENV["DATABASE_URL"]
  # Production
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  # Development
  ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "glossary"
)
end

# use Rack::Flash
class Term < ActiveRecord::Base
  has_one :category
end

class Category < ActiveRecord::Base
  has_many :terms
end
