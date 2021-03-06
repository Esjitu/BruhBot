#!/home/atlas/.rbenv/shims/ruby

require 'discordrb'

require_relative 'config.rb'

Dir['plugins/events/*.rb'].each { |r| require_relative r }
Dir['plugins/commands/*.rb'].each { |r| require_relative r }

bot = Discordrb::Commands::CommandBot.new token: 'MTg1MDIyNzg1NDUyNTA3MTM3.Cic7ZQ.ONL7sthgX5ojb_NRj-QF48nMofk', application_id: 185022247713505280, prefix: commandprefix

plugins.each { |m| bot.include! m }


# Here we output the invite URL to the console so the bot account can be invited to the channel. This only has to be
# done once, afterwards, you can remove this part if you want
puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

bot.command(:exit, help_available: false) do |event|
  break unless event.user.id == 70979549097103360 # Replace number with your ID

  bot.send_message(event.channel.id, shutdownmessage)
  exit
end

bot.run
