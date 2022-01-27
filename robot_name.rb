class Robot
  attr_reader :name

  @@count = 1
  def initialize
    loop do
      part1 = Array.new(2) { [*"A".."Z"].sample }.join
      part2 = Array.new(3) { [*"0".."9"].sample }.join
      @name = part1 + part2
      break if @@count == 1 || @name != @@oldname
    end
    @@count += 1
    @@oldname = @name.clone
  end

  def reset
    @name = 'AB123'
  end
end
