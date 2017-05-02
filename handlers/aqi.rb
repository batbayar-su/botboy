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

        http_response = http.get "http://api.waqi.info/search/?keyword=#{keyword}&token=#{ENV['WAQI_TOKEN']}"
        parsed_json = MultiJson.load http_response.body
        # raise parsed_json.to_s
        if parsed_json['data'].empty?
          response.reply "Could find location.\nSensors in UB: 100 ail, baruun 4 zam, bukhiin urguu, M.N.B, Ulaanbaatar Us Embassy, misheel expo, mongol gazar, urgakh naran, nisekh"
        else
          response.reply "Current AQI: #{parsed_json['data'][0]['aqi']}"
        end
      end

      Lita.register_handler(self)
    end
  end
end
