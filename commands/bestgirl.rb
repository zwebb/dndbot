require_relative "command.rb"

class BestGirlCommand < Command
  def initialize(bot)
    super()
    @bot = bot
    @plevel = 0
  end

  def call(event, args)
    @bot.commands[:google].call(event, ["fuuka", "yamagishi"])
  end
end
