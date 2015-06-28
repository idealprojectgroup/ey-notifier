require 'engineyard/notifier'
extend EY::Notifier::Serverside::Deploy

EY::Notifier.configure do |config|
  config.notify :hipchat, "token",
    stage: :after_bundle,
    room: "Test Room",
    message: -> { "A message about deployment." }
end
