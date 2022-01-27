class BeerSong
  def self.verse(line)
    case line
    when 0 then "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2 then "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
      "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(start, finish)
    result = []
    start.downto(finish) do |line|
      result << BeerSong.verse(line)
    end
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
