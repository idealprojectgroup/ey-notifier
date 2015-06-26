require 'singleton'
require 'logger'

module EY
  module Notifier
    class Error < StandardError; end

    module Notifications
    end

    def self.notifications
      @notifications ||= {
        before_bundle: [],
        after_bundle: [],
        before_compile_assets: [],
        after_compile_assets: [],
        before_migrate: [],
        after_migrate: [],
        before_symlink: [],
        after_symlink: [],
        before_restart: [],
        after_restart: [],
      }
    end

    class Configuration
      include Singleton

      def self.default_logger
        logger = Logger.new(STDOUT)
        logger.progname = 'ey-notifier'
        logger
      end

      def self.defaults
        @defaults ||= {
          logger: default_logger,
        }
      end

      def initialize
        self.class.defaults.each_pair { |k, v| send("#{k}=", v) }
      end

      def notify(service, token, options = {})
        Notifier.configure_notification(service, token, options)
      end

      attr_accessor :logger
    end

    def self.config
      Configuration.instance
    end

    def self.configure
      yield config
    end

    def self.logger
      config.logger
    end

    class DeploymentMetadata
      def deployed_by
        "A user"
      end

      def branch
        "some-branch"
      end

      def environment
        "some_environment"
      end
    end

    def self.notify(what)
      notifications[what].each do |notification|
        logger.debug "#{notification.service} #{what}: #{DeploymentMetadata.new.instance_exec(&notification.options[:message])}"
      end
    end

    class Notification
      def initialize(service, token, options)
        @service = service
        @token = token
        @options = options
      end

      attr_accessor :service, :token, :options
    end

    def self.configure_notification(service, token, options = {})
      logger.debug "#{service}, #{token}, #{options}"
      notifications[options[:stage]] << Notification.new(service, token, options)
    end
  end
end

require 'engineyard/notifier/version'
