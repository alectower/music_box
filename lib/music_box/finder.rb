require 'find'

module MusicBox
  module Finder
    
    ITUNES_ROOT = "#{Dir.home}/Music/iTunes/iTunes\ Media/Music/"
    
    def find(regex, path = ITUNES_ROOT)
      (puts "Did not find music folder : #{path}"; exit) unless Dir.exists? path
      songs = []
      Find.find(path) do |p|
        songs << p if p =~ /#{regex}/i
      end
      songs
    end
  end
end