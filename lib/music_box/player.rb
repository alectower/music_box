module MusicBox
  class Player
    include MusicBox::IOHandler
    include MusicBox::Display
    
    attr_accessor :songs, :current_song
    
    def initialize
      @songs = []
      @command = Command.new(self)
    end
    
    def start
      display_program_info
      display_main_options
      process_input
    end
    
    def play_songs
      while !@songs.empty?
        if !@current_song || !@current_song.playing?
          @current_song = @songs.pop
          @current_song.play do |song_path| 
            NSSound.alloc.initWithContentsOfFile(song_path, byReference: false)
          end
          display_song_info(@current_song.path.split "/")
        end
        process_input
        break if !@current_song.playing?
      end
    end
    
    def process_input
      get_input IO_HASH do |input| 
        @command.process_command input if input
      end
    end
    
  end
end