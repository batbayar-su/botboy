module Lita
  module Handlers
    class Stars < Handler
      route(/star[s|z] (\d*){1}/i, :star_rating, command: true, help: { 'stars <num>' => 'replies with your star rating' })

      def star_rating(response)
        starz = response.args.first.to_i

        if starz > 3
          response.reply "Wow! #{starz} stars!\nYou must be an internationally recognized expert!"
        else
          response.reply 'You are not your star count! We <3 you!'
        end
      end

      Lita.register_handler(self)
    end

    class StarsHttp < Handler
      http.get '/stars/:num', :star_rating

      def star_rating(request, response)
        starz = request.env['router.params'][:num].to_i
        message = starz < 4 ? 'You are not your star count! We <3 you!' : "Wow! #{starz} stars!\nYou must be an internationally recognized expert!"

        body = { starz: starz, message: message }

        response.headers['Content-Type'] = 'application/json'
        response.write MultiJson.dump(body)
      end

      Lita.register_handler(self)
    end
  end
end
