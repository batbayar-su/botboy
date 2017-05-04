require 'dotenv/load'
require './handlers/air_quality.rb'
require './handlers/ascii_art.rb'
require './handlers/bitly.rb'
require './handlers/cleverhandler.rb'
require './handlers/fuck_detector.rb'
require './handlers/weather.rb'
require './handlers/whois.rb'

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = 'botboy'
  config.robot.mention_name = 'botboy'
  config.robot.alias = '/'
  config.robot.log_level = :info

  # Slack
  # config.robot.adapter = :slack
  # config.robot.admins = ['U377TK9U7']
  # config.adapters.slack.token = ENV['SLACK_TOKEN']

  # config.adapters.slack.link_names = true
  # config.adapters.slack.parse = 'full'
  # config.adapters.slack.unfurl_links = false
  # config.adapters.slack.unfurl_media = false

  ## Example: Set options for the Redis connection.
  config.redis.host = '127.0.0.1'
  config.redis.port = 6379

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.karma.cooldown = 300.
  # config.handlers.some_handler.some_config_key = 'value'
  config.handlers.bitly.username = "o_38cg6ei8cu"
  config.handlers.bitly.apikey = "R_bd8935e320bb40d496d4e19373f9af68"
  # cleverbot global variable
  $cleverbot = Cleverbot.new('CC1z5h_EyiKuIIynaD3JxTGahAA')

  # config.robot.adapter = :chatwork
  # config.adapters.chatwork.api_key = ENV['CHATWORK_API_KEY']
  # config.adapters.chatwork.interval = 5
end
