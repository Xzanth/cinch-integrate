require "cinch"
require "slack-ruby-client"

module Cinch
  module Plugins
    # Cinch plugin to enable integration with other services
    class Integrate
      include Cinch::Plugin

      listen_to :connect,   method: :setup
      listen_to :integrate, method: :run_integration

      def setup(*)
        if config[:integrations].include?(:slack)
          Slack.configure do |c|
            c.token = config[:slack_key]
            raise "No slack key supplied" unless c.token
          end
          @slack = Slack::Web::Client.new
        end
      end

      def run_integration(_m, integration, message)
        unless config[:integrations].include?(integration)
          error "Integration not initialized"
          return
        end
        case integration
        when :slack
          @slack.chat_postMessage(
            channel: message[:channel],
            text: message[:text],
            as_user: message[:as_user]
          )
        else
          error "Integration not supported"
        end
      end
    end
  end
end
