require 'music_box/player'
require 'music_box/command'
require 'music_box/io_handler'
require 'music_box/display'

module MusicBox
  class Runner
    
    def initialize
      @player = MusicBox::Player.new
      @command = MusicBox::Command.new(@player)
      @display = MusicBox::Display.new(@player)
      @io_handler = MusicBox::IOHandler.new(@command, @display)
    end
    
    def run
      @display.display_program_info
      @display.display_main_options
      @display.display_input_ready
      loop do
        @io_handler.get_input
        @player.play
      end
    end
  end
end