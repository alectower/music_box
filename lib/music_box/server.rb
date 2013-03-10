PROJECT_LIB = File.expand_path(File.dirname(__FILE__) + "/../../lib")
$: << PROJECT_LIB unless $:.include? PROJECT_LIB

require 'rubygems'
require 'em/pure_ruby'
require 'music_box/player'

module MusicBox
  class Server < EventMachine::Connection
    
    attr_reader :player

    def initialize(player = MusicBox::Player.instance)
      @player = player
      super
    end

    def receive_data(data)
      player.run_command(data)
    end
  end
end

EM.run do
  EM.start_server "127.0.0.1", 8081, MusicBox::Server 
end
