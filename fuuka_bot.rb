require_relative "commands/8ball.rb"
require_relative "commands/bestgirl.rb"
require_relative "commands/coin.rb"
require_relative "commands/exit.rb"
require_relative "commands/frozen.rb"
require_relative "commands/gif.rb"
require_relative "commands/google.rb"
require_relative "commands/help.rb"
require_relative "commands/math.rb"
require_relative "commands/music.rb"
require_relative "commands/p-list.rb"
require_relative "commands/p-lower.rb"
require_relative "commands/p-raise.rb"
require_relative "commands/ping.rb"
require_relative "commands/playing.rb"
require_relative "commands/poll.rb"
require_relative "commands/roll.rb"
require_relative "commands/youtube.rb"

class FuukaBot
  def initialize(bot)
    @rand = Random.new
    @commands = {
      :"8ball" => EightballCommand.new,
      :bestgirl => BestGirlCommand.new(self),
      :coin => CoinCommand.new,
      :exit => ExitCommand.new,
      :frozen => FrozenCommand.new,
      :gif => GifCommand.new,
      :google => GoogleCommand.new,
      :help => HelpCommand.new(self),
      :math => MathCommand.new,
      :music => MusicCommand.new(bot),
      :"p-list" => PListCommand.new(self),
      :"p-lower" => PLowerCommand.new(self),
      :"p-raise" => PRaiseCommand.new(self),
      :ping => PingCommand.new,
      :playing => PlayingCommand.new,
      :poll => PollCommand.new,
      :roll => RollCommand.new,
      :youtube => YoutubeCommand.new
    }
  end

  def access_allowed(command, user)
    @commands[command].plevel <= get_plevel(user)
  end

  attr_accessor :commands
end
    