module Lita
  module Handlers
    class UpstateHttp
      extend Lita::Handler::HTTPRouter

      http.get '/', :index_page

      def index_page request, response
        if params['hub.mode'] == 'subscribe' &&
           params['hub.verify_token'] == 'test_batbayar_b0tb0y'

          params['hub.challenge']
        else
          'Nothing to see here'
        end
      end

      Lita.register_handler(UpstateHttp)
    end
  end
end
