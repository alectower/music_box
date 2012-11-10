require 'observer'
framework 'cocoa'

module MusicBox
  class Player
    include Observable
    
    attr_accessor :songs
    
    def initialize
      @songs = []
    end
    
    def play_song(song)
      @song = NSSound.alloc.initWithContentsOfFile(song.path, byReference: false)
      changed
      notify_observers(song)
      @song.play if @song
    end
    
    def stop_song
      @song.stop if @song
    end
    
    def pause_song
      @song.pause if @song
    end
    
    def resume_song
      @song.resume if @song
    end
    
    def playing?
      @song.isPlaying if @song
    end
    
    def end_of_song?
      (@song.currentTime.to_i == @song.duration.to_i) if @song
    end
    
    def next_song
      if playing?
        stop_song
        play_song(@songs.shift)
      end
    end
    
    def play
      play_song(@songs.shift) if (end_of_song? && !@songs.empty?)
    end
    
  end
end