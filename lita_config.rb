require './handlers/aqi.rb'
require './handlers/weather.rb'

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = 'botboy'
  config.robot.mention_name = 'bboy'
  config.robot.alias = '/'

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ['42', '21']

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  # config.robot.adapter = :shell

  # Slack
  config.robot.adapter = :slack
  config.robot.admins = ['U377TK9U7']

  config.adapters.slack.token = 'xoxb-169227204611-KGGQVRrjQYxF1J9uijZTYt5C'

  config.adapters.slack.link_names = true
  config.adapters.slack.parse = 'full'
  config.adapters.slack.unfurl_links = false
  config.adapters.slack.unfurl_media = false

  # Facebook
  # config.robot.adapter = 'facebook-messenger'

  # config.adapters.facebook_messenger.facebook_access_token = 'EAAJE8fThk8wBAFdm6p4XWWkDzCKfPZBVMUxSko5ZCyJf4KOCHKxBiCWjZC4mu3XDZCKShQcZB4vghR3ZAyy7aMYpOAgJbOo3YZA2fgOe6by7WyhJTZA3ov6Yivk3QbqRVZBiOULKMalAR7xvwXBj919fuAr90LZCMOa3RBAmWcXXGzQwZDZD'
  # config.adapters.facebook_messenger.facebook_app_secret = '515268e61f82fa3fe73249b6c37ba06e'
  # config.adapters.facebook_messenger.facebook_verify_token = '1775985616060026'

  ## Example: Set options for the Redis connection.
  config.redis.host = '127.0.0.1'
  config.redis.port = 6379

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.karma.cooldown = 300.
  # config.handlers.some_handler.some_config_key = 'value'
  config.handlers.ai.api_user = 'aNP5JlfNunjxMAV7'
  config.handlers.ai.api_key = 'NuSesgP0KioWhP3l47MqrCugsnjgMom2'

  # config.robot.adapter = :chatwork
  # config.adapters.chatwork.api_key = 'e685ad0bb04e309723d9bf4cef36b2d8'
  # config.adapters.chatwork.interval = 5
end
