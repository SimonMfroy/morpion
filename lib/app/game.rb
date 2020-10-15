require 'bundler'
Bundler.require

require_relative 'board'

class Game
  attr_accessor :array_choice, :array_a, :array_b, :array_c, :array_number
  attr_accessor :wich_player_play
  attr_accessor :victory_a, :victory_b, :victory_c
  attr_accessor :victory_1, :victory_2, :victory_3
  attr_accessor :victory_d_1, :victory_d_2
  attr_accessor :final_victory
  def initialize
    @players = []
    @array_choice = []
    @array_choice[0] = "a1","b1","c1"
    @array_choice[1] = "a2","b2","c2"
    @array_choice[2] = "a3","b3","c3"


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

    @array_number = " |1|2|3|"

    @wich_player_play = 0

    @victory_a = 0
    @victory_b = 0
    @victory_c = 0

    @victory_1 = 0
    @victory_2 = 0
    @victory_3 = 0

    @victory_d_1 = 0
    @victory_d_2 = 0

    @final_victory = 0

    create_players
    menu
  end

  def create_players
    game_symbol = ['O', 'X']
    
    game_symbol.each_with_index do |symbol, index|
      puts "Player #{index + 1}, enter your Name :"
      @players << Player.new(symbol)
      puts ""
    end 
  end

  def show_board
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
    puts "#{@array_a[0]}#{@array_a[1]}#{@array_a[2]}#{@array_a[3]}"
    puts "#{@array_b[0]}#{@array_b[1]}#{@array_b[2]}#{@array_b[3]}"
    puts "#{@array_c[0]}#{@array_c[1]}#{@array_c[2]}#{@array_c[3]}"
    puts ""
    puts "************************* "
    puts "************************* "
  end

  def menu
      puts " Où voulez-vous jouer ?"
      puts " Case disponible :"
      print @array_choice[0]
      puts ""
      print @array_choice[1]
      puts ""
      print @array_choice[2]
      puts ""
  end

  def menu_choice(choice, symbol_player)
    case choice
      when "a1"
        @array_choice[0].shift
        @array_a[1] = "#{symbol_player}|"
        show_gameboard
      when "b1"
        array_choice[0].shift
        array_b[1]="#{symbol_player}|"
        show_gameboard
      when "c1"
        array_choice[0].shift
        array_c[1] ="#{symbol_player}|"
        show_gameboard
      when "a2"
        array_choice[1] = array_choice[1] - ["a2"]
        array_a[2] ="#{symbol_player}|"
        show_gameboard
      when "b2"
        array_choice[1] = array_choice[1] - ["b2"]
        array_b[2] ="#{symbol_player}|"
        show_gameboard
      when "c2"
        array_choice[1] = array_choice[1] - ["c2"]
        array_c[2] ="#{symbol_player}|"
        show_gameboard
      when "a3"
        array_choice[2] = array_choice[2] - ["a3"]
        array_a[3] ="#{symbol_player}|"
        show_gameboard
      when "b3"
        array_choice[2] = array_choice[2] - ["b3"]
        array_b[3] ="#{symbol_player}|"
        show_gameboard
      when "c3"
        array_choice[2] = array_choice[2] - ["c3"]
        array_c[3] ="#{symbol_player}|"
        show_gameboard
      else 
        puts "wrong input"
    end

  end

  def test_victory

    condition_victory

      if @victory_a == 3 || @victory_1 == 3 || @victory_d_1 == 3
        puts "#{@players[0].name} with #{@players[0].symbol} a gagné "
        return false 
      elsif @victory_a == -3 || @victory_1 == -3 || @victory_d_1 == -3
        puts "#{@players[1].name} with #{@players[1].symbol} a gagné "
        return false 
      end

      if @victory_b == 3 || @victory_2 == 3 || @victory_d_2 == 3
        puts "#{@players[0].name} with #{@players[0].symbol} a gagné "
        return false 
      elsif @victory_b == -3 || @victory_2 == -3 || @victory_d_2 == -3
        puts "#{@players[1].name} with #{@players[1].symbol} a gagné "
        return false 
      end

      if @victory_c == 3 || @victory_3 == 3
        puts "#{@players[1].name} with #{@players[1].symbol} a gagné "
        return false 
      elsif @victory_c == -3 || @victory_3 == -3
        puts "#{@players[0].name} with #{@players[0].symbol} a gagné "
        return false 
      end
    return true
  end

  def condition_victory

    @victory_a = 0
    @victory_b = 0
    @victory_c = 0

    @victory_1 = 0
    @victory_2 = 0
    @victory_3 = 0

    @victory_d_1 = 0
    @victory_d_2 = 0

    if  array_a[3].include?("x") && array_b[2].include?("x") && array_c[1].include?("x")
        @victory_d_1 = 3
    elsif array_a[3].include?("o") && array_b[2].include?("o") && array_c[1].include?("o")
        @victory_d_1 = -3
    end

    if  array_a[1].include?("x") && array_b[2].include?("x") && array_c[3].include?("x")
        @victory_d_1 = 3
    elsif array_a[1].include?("o") && array_b[2].include?("o") && array_c[3].include?("o")
        @victory_d_1 -3
    end

    if  array_a[1].include?("x") && array_b[1].include?("x") && array_c[1].include?("x")
        @victory_1 = 3
    elsif array_a[1].include?("o") && array_b[1].include?("o") && array_c[1].include?("o")
        @victory_1 = 3
    end

    if  array_a[2].include?("x") && array_b[2].include?("x") && array_c[2].include?("x")
        @victory_2 =3
    elsif array_a[2].include?("o") && array_b[2].include?("o") && array_c[2].include?("o")
        @victory_2 = 3
    end

    if  array_a[3].include?("x") && array_b[3].include?("x") && array_c[3].include?("x")
        @victory_3 =3
    elsif array_a[3].include?("o") && array_b[3].include?("o") && array_c[3].include?("o")
        @victory_3 = 3
    end


    array_a[1..3].each do |n| 
      if n.include?("x")
        @victory_a = @victory_a+ 1
      elsif n.include?("o")
        @victory_a = @victory_a-1
      end
    end
      
    array_b[1..3].each do |n| 
      if n.include?("x")
        @victory_b =@victory_b+ 1
      elsif n.include?("o")
        @victory_b =@victory_b- 1
      end
    end

    array_c[1..3].each do |n| 
      if n.include?("x")
        @victory_c =@victory_c+ 1
      elsif n.include?("o")
        @victory_c =@victory_c- 1
      end
    end

  end

end
