require 'sinatra'
require 'json'
require 'yaml'

# token=XXXXXXXXXXXXXXXXXX
# team_id=T0001
# team_domain=example
# channel_id=C2147483705
# channel_name=test
# timestamp=1355517523.000005
# user_id=U2147483697
# user_name=Steve
# text=googlebot: What is the air-speed velocity of an unladen swallow?
# trigger_word=googlebot:

post '/' do
  config = YAML.load_file('slackbot.yml')

  token = params['token']
  if token != config['token']
    status 401
    puts "Token doesn't match."
    return ''
  end

  team_id = params['team_id']
  team_domain = params['team_domain']
  channel_id = params['channel_id']
  channel_name = params['channel_name']
  timestamp = params['timestamp']
  user_id = params['user_id']
  user_name = params['user_name']
  text = params['text']
  trigger_word = params['trigger_word']

  response = "Hi, @#{user_name}!"

  content_type 'application/json'
  JSON.generate({ :text => response, :link_names => 1 })
end
