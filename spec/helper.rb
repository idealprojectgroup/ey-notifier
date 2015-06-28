require 'rspec'
require 'engineyard/notifier'

EY::Notifier.config.logger = Logger.new('/dev/null')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
