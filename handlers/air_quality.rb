module Lita
  module Handlers
    # Air Quality Index
    class AirQuality < Handler
      route(/air\squality\s(in|at|of)?(?<keyword>.*)/i, :aqi,
            command: false, help: { 'air quality <address>' => "enter search word just after air quality.\nEx: air quality ulaanbaatar" })

      def aqi(response)
        keyword = response.match_data['keyword']

        http_response = http.get "http://api.waqi.info/search/?keyword=#{keyword}&token=#{ENV['WAQI_TOKEN']}"
        parsed_json = MultiJson.load http_response.body
        # raise keyword.to_s
        if parsed_json['status'] != 'ok' || parsed_json['data'].length.zero?
          response.reply 'Could not find location.'
        else
          average_air_quality = 0.0
          parsed_json['data'].each do |data|
            average_air_quality += data['aqi'].to_f
          end
          average_air_quality /= parsed_json['data'].length
          response.reply "Average of #{parsed_json['data'].length} stations: #{average_air_quality.round(2)}"
        end
      end

      Lita.register_handler(AirQuality)
    end
  end
end
