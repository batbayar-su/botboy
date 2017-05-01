module Lita
  module Handlers
    # Air Quality Index
    class Aqi < Handler
      route(/aqi(.*)/i, :aqi, command: true,
                              help: { 'aqi <address>' => "enter search word just after aqi.\nEx: aqi 4 zam
                                      \nSensors in UB: 100 ail, baruun 4 zam, bukhiin urguu, M.N.B, Ulaanbaatar Us Embassy, misheel expo, mongol gazar, urgakh naran, nisekh" })

      def aqi(response)
        if response.args.length.to_i < 1
          response.reply "enter search word just after aqi.\nEx: aqi 4 zam
                          \nSensors in UB: 100 ail, baruun 4 zam, bukhiin urguu, M.N.B, Ulaanbaatar Us Embassy, misheel expo, mongol gazar, urgakh naran, nisekh"
          return
        end

        keyword = response.args.join(' ')

        http_response = http.get "http://api.waqi.info/search/?keyword=#{keyword}&token=634857793591a20ec396a490ec6cc001ffde8cee"
        parsed_json = MultiJson.load http_response.body

        response.reply "Current AQI: #{parsed_json['data'][0]['aqi']}"
      end

      Lita.register_handler(self)
    end
  end
end
