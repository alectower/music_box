framework 'Cocoa'

module MusicBox
  class Song
    
    attr_reader :path, :title, :album, :artist, :song
    private :song

    def initialize(song_path)
      @path = song_path           
      @title = song_path.split("/").last
      @album = song_path.split("/")[-2]
      @artist = song_path.split("/")[-3]
    end

    def play
      @song = NSSound.alloc.initWithContentsOfFile(path, byReference:false)
      song.play
    end

    def pause
      song.pause if song
    end

    def resume
      song.resume if song
    end

    def stop
      song.stop if song
    end

    def is_over?
      song.currentTime >= song.duration
    end
    
  end
end
