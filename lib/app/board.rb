require 'bundler'
Bundler.require

class Board
	attr_accessor :array_a, :array_b, :array_c, :array_number  

	def initialize

		@array_number = " |1|2|3|"
		@array_a = []
		@array_b = []
		@array_c = []
		@array_a[0]="a|"
		@array_a[1]=" |"
		@array_a[2]=" |"
		@array_a[3]=" |"
		@array_b[0]="b|"
		@array_b[1]=" |"
		@array_b[2]=" |"
		@array_b[3]=" |"
		@array_c[0]="c|"
		@array_c[1]=" |"
		@array_c[2]=" |"
		@array_c[3]=" |"

		show_gameboard
	end

	def show_gameboard
		puts @array_number
		puts @array_a[0]+@array_a[1]+@array_a[2]+@array_a[3]
		puts @array_b[0]+@array_b[1]+@array_b[2]+@array_b[3]
		puts @array_c[0]+@array_c[1]+@array_c[2]+@array_c[3]
	end

end