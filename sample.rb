require 'simple_oauth'
require "twitter"

Twitter.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end

class Time
  def self.jpn
    Time.now.utc + 3600*9
  end
end

class Notice
  def self.tweet(mon)
    if mon.result
      message = mon.messages["success"] + " " + Time.jpn.strftime("%H:%M:%S")
    else
      message = mon.messages["failed"] + " " + Time.jpn.strftime("%H:%M:%S")
    end
    $log.debug("Tweeted " + message)
    Twitter.update(message)
  end
  def self.mail
    #ここに意識の高いコードが入ります
  end
end