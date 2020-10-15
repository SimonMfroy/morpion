require 'bundler'
Bundler.require



class Application
  attr_reader :game

  def initialize
    game_introduction
  end

  private

  def game_introduction
    puts ""
    puts "************************* "
    puts "*                       * "
    puts "***   Morpion Game    *** "
    puts "*                       * "
    puts "************************* "
    puts ""
    sleep (0.5)
  end

  def new_game

  end

  def end_game

  end

end
