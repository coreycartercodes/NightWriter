require './lib/text_to_braille'
require './lib/braille_to_text'

class Writer
  attr_reader :alpha

  def initialize
    @alpha = TextToBraille.new
    @braille = BrailleToText.new
  end

  #### Text to Braille
  def braille_top_line(line)
    top_line = ""
    line.each do |character|
      top_line << @alpha.alpha_to_braille_top(character)
    end
    top_line
  end

  def braille_middle_line(line)
    middle_line = ""
    line.each do |character|
      middle_line << @alpha.alpha_to_braille_middle(character)
    end
    middle_line
  end

  def braille_bottom_line(line)
    bottom_line = ""
    line.each do |character|
      bottom_line << @alpha.alpha_to_braille_bottom(character)
    end
    bottom_line
  end

  def write_braille_line(line)
    braille_line = "#{braille_top_line(line)}\n#{braille_middle_line(line)}\n#{braille_bottom_line(line)}\n"
  end
  #### Braille to Text
  def write_braille_string(braille_string)
    braille_string.map do |line|
      line.map do |character|
        @braille.translate_braille_character(character)
      end
    end.join
  end

end
