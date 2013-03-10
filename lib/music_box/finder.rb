require 'find'
require 'music_box/error'

module MusicBox
  class Finder
    
    ITUNES_ROOT = "#{Dir.home}/Music/iTunes/iTunes\ Media/Music/"

    def find(player_args)
      raise MusicBox::Error.new("Did not find music folder : #{ITUNES_ROOT}") unless Dir.exists? ITUNES_ROOT
      songs = find_songs(construct_regex(player_args[:album_artists_songs]))
      songs.shuffle! if player_args[:shuffle]
      songs
    end

    def construct_regex(names)
      regex = "("
      names.each_with_index do |name, index|
        regex << "#{name}"
        regex << "|" unless (index + 1 == names.size)
      end
      regex << ")+.*\.m[(p3)(4a)]+$"
    end
    
    def find_songs(regex)
      songs = []
      p regex
      Find.find(ITUNES_ROOT) do |path|
        songs << path if path =~ /#{regex}/i
      end
      songs
    end

  end
end
