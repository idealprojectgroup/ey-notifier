require 'rspec'
require 'engineyard/notifier'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
