class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],
    [6,7,8], [0,3,6],
    [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

def initialize(board = nil)
  @board = Array.new(9, " ")
end

def board
  @board
end

def input_to_index(input)
  input.to_i - 1
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_position_1 = win_combination[0]
    win_position_2 = win_combination[1]
    win_position_3 = win_combination[2]

    position_1 = board[win_position_1]
    position_2 = board[win_position_2]
    position_3 = board[win_position_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
else false
    end
  end
end

def move(index, token)
@board[index] = token
end

def valid_move?(index)
if !position_taken?(index) && index.between?(0, 8)
  return true
else
  return false
end
end

def turn_count
  turn_count = 0
  @board.each do |token|
    if  token == "X" || token == "O"
    turn_count += 1
  end
end
turn_count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def over?
  won? || draw? ? true:false
end

def full?
@board.all? do |token|
  position_taken?(@board.index(token))
  end
end

def draw?
  if !won? && full?
    return true
  end
end

def winner
  if won?
    @board[win_combination.first]
  end
end

def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(index)
  token = current_player
  move(index, token)
  display_board
else
  turn
end
end

def play
  until over?
    turn
  end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat's Game!"
  end
end

end
