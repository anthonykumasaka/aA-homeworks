class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    14.times {|i| @cups[i] = [:stone, :stone, :stone, :stone] unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, 13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i > 13
      @cups[i] << stones.pop unless i == 13 && current_player_name == @name1 || i == 6 && current_player_name == @name2
    end
    self.render
    self.next_turn(i)

  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (7..12).all? {|i| @cups[i] == []} || (0..5).all? {|i| @cups[i] == []}
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[13].length > @cups[6].length
      return @name2
    else
      return :draw
    end
  end
end
