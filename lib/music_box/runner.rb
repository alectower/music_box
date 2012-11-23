require 'player'
require 'io_handler'
require 'command'
require 'display'

module MusicBox
	class Runner
		def run
			player = Player.new
			display = Display.new(player)
			handler = IOHandler.new(Command.new(player), display)
			display.display_program_info
			display.display_main_options
			display.display_input_ready
			loop do
				handler.get_input
			end
		end
	end
end

