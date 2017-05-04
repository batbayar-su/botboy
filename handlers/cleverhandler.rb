require 'ruby-cleverbot-api'

module Lita
  module Handlers
    class CleverHandler < Handler
      config :cleverbot
      on :unhandled_message, :chat

      def chat(payload)
        # raise payload[:message].body.to_s
        message = payload[:message]
        # cleverbot =
        message_response = $cleverbot.send_message(message.body)

        robot.send_message(message.source, message_response)
      end

      Lita.register_handler(CleverHandler)
    end
  end
end
