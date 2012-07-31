module MusicBox
  class Song
    
    attr_reader :path
    
    def initialize(song_path)
      @path = song_path
    end
    
    def play(&block)
      @song = block.call(@path)
      @song.play if @song
    end
    
    def stop
      @song.stop if @song
    end
    
    def pause
      @song.pause if @song
    end
    
    def resume
      @song.resume if @song
    end
    
    def playing?
      @song.isPlaying if @song
    end
  end
end