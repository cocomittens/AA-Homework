require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Starting a new game. First round: "
    sleep(2)
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system "clear"
    show_sequence
    sequence_length.times do |idx|
      @game_over = true if seq[idx]!=require_sequence
    end
    round_success_message unless game_over
    sleep(2)
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(2)
      system "clear"
    end
  end

  def require_sequence
    puts "Enter sequence, one color at a time: "
    gets.chomp
  end

  def add_random_color
    seq << COLORS[rand(COLORS.count)]
  end

  def round_success_message
    puts "Success! Next round: "
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play