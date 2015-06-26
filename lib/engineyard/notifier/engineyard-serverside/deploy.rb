module EY
  module Notifier
    module Serverside
      module Deploy
        def callback(what)
          super

          EY::Notifier.notify(what)
        end
      end
    end
  end
end
