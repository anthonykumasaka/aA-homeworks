class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      self.take_turn
      # sleep 0.50
      system("clear")
    end
    self.game_over_message
    self.reset_game
    sleep 1
    system("clear")
    self.play
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless @game_over
      self.round_success_message
      sleep 1
      self.sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    self.seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 0.5
    end
  end

# The goal of require_sequence is to prompt the user to repeat back
# the new sequence that was just shown to them, one color at a time.
# If they give an incorrect color, it should immediately set @game_over
# to be true.
  def require_sequence
    puts "Repeat back the sequence"
    self.seq.each do |color|
      input = gets.chomp
      if color[0] != input
        self.game_over = true
        break
      end
    end
    # sleep 0.50
  end

  def add_random_color
    @seq << %w(red blue yellow green).shuffle.last
  end

  def round_success_message
    puts "Nice Job! Here is the next sequence"
  end

  def game_over_message
    puts "Wrong... you may want to consider playing an easier game"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
