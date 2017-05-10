require 'url_shortener'

module Lita
  module Handlers
    class Bitly < Handler
      route(/(?:bitly|shorten)\s(.+)/i, :shorten_url,
            command: true, help: { 'bitly | shorten URL' => 'Shorten the URL using bitly' })

      def self.default_config(handler_config)
        handler_config.username = nil
        handler_config.apikey = nil
      end

      def shorten_url(response)
        username = Lita.config.handlers.bitly.username
        Lita.logger.debug("Got Bitly Username: #{username}")
        apikey = Lita.config.handlers.bitly.apikey
        input_url = response.matches[0][0]
        Lita.logger.debug("Bitly() - Input url -  #{input_url}")

        unless /^https?:\/\/.+/i =~ input_url
          Lita.logger.debug('Bitly() - Input URL Does not start with http://. Appending ..')
          input_url.prepend('http://')
          Lita.logger.debug(input_url)
        end

        Lita.logger.debug('Authorizing')
        authorize = UrlShortener::Authorize.new username, apikey
        client = UrlShortener::Client.new authorize
        shorten = client.shorten(input_url)
        response.reply(shorten.urls)
      end
    end

    Lita.register_handler(Bitly)
  end
end
