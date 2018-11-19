# -*- coding: utf-8 -*-

require 'twitter'
require 'dotenv'

YOUR_CONSUMER_KEY = ENV['NCCB_TWITTER_CONSUMER_KEY']
YOUR_CONSUMER_SECRET = ENV['NCCB_TWITTER_CONSUMER_SECRET']
YOUR_OAUTH_TOKEN = ENV['NCCB_TWITTER_OAUTH_TOKEN']
YOUR_OAUTH_TOKEN_SECRET = ENV['NCCB_TWITTER_OAUTH_TOKEN_SECRET']

client = Twitter::REST::Client.new do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.access_token = YOUR_OAUTH_TOKEN
  config.access_token_secret = YOUR_OAUTH_TOKEN_SECRET
end

line = STDIN.readline
client.update(line)
