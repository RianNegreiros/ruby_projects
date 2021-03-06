class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Player < Person
  attr_reader :sign

  def initialize(name, sign)
    super(name)
    @sign = sign
  end

  def print
    puts "Name: #{@name}, Sign: #{@sign}"
  end
end

class Board
  def initialize(player1, player2)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = player1
    @player2 = player2
  end

  def reset_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---+---+---'
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---+---+--- '
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(position)
    @board[position] != ' '
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    @current_player = @turn_count.odd? ? @player1 : @player2
    print "#{@current_player}, Please choose a number between 1-9: "
    position = gets.chomp.to_i
    position -= 1
    if valid_move?(position)
      @board[position] = @current_player.sign
    else
      puts "Invalid position or input"
      turn
    end
  end

  def play
    @turn_count = 0
    until over?
      @turn_count += 1
      turn
      puts "###########"
      display_board
    end
    print "Game Over "

    if won?
      puts "Congratulations #{@current_player.name} you are the winner."
    else
      puts "Its a draw, better luck next time !"
    end
    puts "Doy want to start again? press Y/N"
    answer = gets.chomp
    if %w[Y y].include?(answer)
      reset_board
      play
    else
      puts "See you again !"
    end
  end
end

class TicTacToe < Board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def draw?
    !won? && full?
  end

  def full?
    @turn_count == 9
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
    end
  end

    def over?
      won? || full? || draw?
    end
end

