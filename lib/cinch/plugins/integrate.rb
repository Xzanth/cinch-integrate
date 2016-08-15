require "cinch"
require "slack-ruby-client"

module Cinch
  module Plugins
    # Cinch plugin to enable integration with other services
    class Integrate
      include Cinch::Plugin

      listen_to :notify_integrate
      def listen(_m, message_type, message)
        config[:integration_hash][message_type].each do |integration|
          run_integration(integration, message)
        end
      end

      def setup(*)
        if config[:integrations].include?("slack")
          Slack.configure do |config|
            config.token = config[:slack_key]
            raise "No slack key supplied" unless config.token
          end
          @slack = Slack::Web::Client.new
        end
      end

      def run_integration(integration, message)
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
