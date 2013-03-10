module MusicBox
  class CommandParser
    
    def parse_command(command)
      play = {
        :album_artists_songs => [],
        :shuffle => false
      }
      if command.include?("shuffle") 
        play[:shuffle] = true
        command["shuffle"] = ""
        if command.include?(",")
          command = command.split(",")
        end
      elsif command.include?(",")
        command = command.split(",")
      end
      command = [command] unless command.kind_of? Array
      command.each do |name|
        play[:album_artists_songs] << name.strip unless name.empty?
      end
      play
    end

  end
end
