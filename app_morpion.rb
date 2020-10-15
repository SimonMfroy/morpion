require 'bundler'
Bundler.require


$:.unshift File.expand_path("./../lib",__FILE__)
require 'app/player'
require 'views/application'
require 'app/board'
require 'app/game'

class Perform

  	attr_reader :application , :current_game
  	attr_accessor :final_victory

  	def initialize
    	@application = Application.new
    	@current_game = Game.new

    	while current_game.test_victory == true
 			choice = gets.chomp
 			current_game.menu_choice(choice, "o")
 			if current_game.test_victory == false
 				return false
 			end
 			current_game.menu
 			choice = gets.chomp
 			current_game.menu_choice(choice,"x")
 			current_game.test_victory
			current_game.menu
		end
  	end

end

Perform.new