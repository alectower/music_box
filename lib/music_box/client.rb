require 'em/pure_ruby'

module MusicBox
  module Client

    def receive_data(data)
      puts data
      EventMachine::stop_event_loop
    end

    def self.send_command(command)
      attempts = 0
      begin
        EventMachine::run do
          EventMachine::connect "127.0.0.1", 8081, self do |c|
            c.send_data command
          end
        end
      rescue Errno::EPIPE
        attempts += 1
        retry
      end
    end

  end
end

