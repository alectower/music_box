require 'music_box/command_parser'
require 'music_box/finder'
require 'music_box/song'
require 'singleton'

module MusicBox
  class Player
    include Singleton

    attr_reader :play_list, :command_parser, :song_finder, :song_thread, :current_song
    
    def initialize(args = {})
      @command_parser = args[:command_parser] || MusicBox::CommandParser.new
      @song_finder = args[:song_finder] || MusicBox::Finder.new
      @play_list = []
    end
    
    def run_command(command)
      command.chomp!
      if current_song.respond_to? command.to_sym
        current_song.send command.to_sym
      else
        update_play_list(command_parser.parse_command(command))
      end 
    end

    def update_play_list(player_args)
      clean_up
      @play_list = song_finder.find(player_args)
      play
    end

    def play
      @song_thread = Thread.new do
        play_list.each do |song|
          @current_song = MusicBox::Song.new(song)
          puts "playing #{current_song.artist} - #{current_song.title}"
          current_song.play
          while !current_song.is_over?
            sleep 3
          end
        end
      end
    end

    def clean_up
      current_song.stop unless current_song.nil?
      play_list.clear
      Thread.kill(song_thread) if song_thread
    end

  end
end
