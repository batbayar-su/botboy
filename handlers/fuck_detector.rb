module Lita
  module Handlers
    class FuckDetector < Handler
      ## Mind your manners will just focus on "Fuck"
      ## for now until others become a problem.
      route(/fuck/i, :mind_your_manners,
            help: { 'lita: fuck you' => 'Advises to clean up your language after saying `fuck`' })

      def mind_your_manners(response)
        username = if response.user.metadata['mention_name'].nil?
                     response.user.name.to_s
                   else
                     response.user.metadata['mention_name'].to_s
                   end

        mind_manners = [
          "Mind your manners #{username}..",
          "You better wash out that dirty mouth #{username}!",
          "That is just unprofessional, #{username}.",
          "Your mother wouldn't like to hear you say that, #{username}.",
          "Quite the potty mouth on you, #{username}..",
          "Good manners are made up of petty sacrifices, #{username}.",
          "Does saying that make you more mature, #{username}?",
          'Rude.'
        ]
        response.reply mind_manners.sample
      end
    end

    Lita.register_handler(FuckDetector)
  end
end
