Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

Game.new.start
