module Lita
  module Handlers
    # Yahoo Weather
    class Weather < Handler
      route(/weather(.*)/i, :weather, command: true,
                                      help: { 'weather <location>' => 'enter location after weather. Ex: weather ulaanbaatar' })

      def weather(response)
        if response.args.length.to_i < 1
          response.reply 'enter location after weather. Ex: weather ulaanbaatar'
          return
        end

        keyword = response.args.join(' ')

        http_response = http.get "http://api.openweathermap.org/data/2.5/weather?q=#{keyword}&units=metric&appid=7b53401353d18be77d136c18e829e235"
        parsed_json = MultiJson.load http_response.body
        # response.reply parsed_json['main']['temp'].to_s

        response.reply "Current temp: #{parsed_json['main']['temp']}, #{parsed_json['weather'][0]['main']}\nHumidity: #{parsed_json['main']['humidity']}\nWind speed: #{parsed_json['wind']['speed']} m/s\n"
      end

      Lita.register_handler(self)
    end
  end
end
