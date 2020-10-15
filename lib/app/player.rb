require 'bundler'
Bundler.require


class Player
  attr_accessor :name
  attr_accessor :symbol
  attr_reader :players

  def initialize(symbol)
    print "> "
    @name = gets.chomp
    @symbol = symbol
    puts "#{name} created, with #{symbol} as your symbol "
    
  end

  

end
