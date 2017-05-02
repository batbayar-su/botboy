require 'cleverbot-api'

module Lita
  module Handlers
    class CleverBot < Handler
      on :unhandled_message, :chat

      def chat(payload)
        # raise payload[:message].body.to_s
        message = payload[:message]
        return unless should_reply?(message)
        bot = CleverBot.new
        raise bot.think message
        message_response = bot.think sentence
        
        robot.send_message(message.source, message_response)
      end

      private

      def should_reply?(message)
        message.command? || message.body =~ /#{aliases.join('|')}/i
      end

      def aliases
        [robot.mention_name, robot.alias].map{|a| a unless a == ''}.compact
      end

      Lita.register_handler(self)
    end
  end
end
