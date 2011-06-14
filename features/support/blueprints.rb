require 'machinist/active_record'
require 'sham'

Sham.name { |x| "name-#{x}" }

Account.blueprint do
  name
end