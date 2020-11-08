require("bundler")
Bundler.require()

account_sid = ENV["TWILIO_SID"]
auth_token = ENV["TWILIO_AUTH"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
                             body: 'Hi there!',
                             from: '+34676780254',
                             to: '+34686516248'
                           )

puts message.sid

# The requested resource /2010-04-01/Accounts//Messages.json was not found
# https://www.twilio.com/docs/errors/20404