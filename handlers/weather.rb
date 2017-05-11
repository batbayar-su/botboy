module Lita
  module Handlers
    # Yahoo Weather
    class Weather < Handler
      route(/weather(in|at)?(.*)/i, :weather,
            command: false, help: { 'weather <location>' => 'enter location after weather. Ex: weather ulaanbaatar' })

      def weather(response)
        if response.args.length.to_i < 1
          response.reply 'enter location after weather. Ex: weather ulaanbaatar'
          return
        end

        keyword = response.args.join(' ')

        http_response = http.get "http://api.openweathermap.org/data/2.5/weather?q=#{keyword}&units=metric&appid=#{ENV['OPENWEATHER_APPID']}"
        parsed_json = MultiJson.load http_response.body
        # response.reply parsed_json
        if parsed_json['cod'] != 200
          response.reply "Could find location.\nenter location after weather. Ex: weather ulaanbaatar"
        else
          response.reply "Place: #{parsed_json['name']}, #{parsed_json['sys']['country']}\nCurrent temp: #{parsed_json['main']['temp']}, #{parsed_json['weather'][0]['main']}\nHumidity: #{parsed_json['main']['humidity']}\nWind speed: #{parsed_json['wind']['speed']} m/s\n"
        end
      end

      Lita.register_handler(Weather)
    end
  end
end
