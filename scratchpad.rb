Dir['src/**/*.rb'].each { |f| puts f; require f }

game = CLIGame.new
