lib = File.expand_path(File.dirname(__FILE__) + "/../lib/music_box")
$: <<  lib unless $:.include? lib
require 'music_box/runner'

