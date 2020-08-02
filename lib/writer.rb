require './lib/text_to_braille'

class Writer
  attr_reader

  def initialize
    @alpha = TextToBraille.new
  end

  def alpha_to_braille_top(line)
    top_line = ""
    line.each do |character|
      top_line << @alpha.alpha_to_braille_top(character)
    end
    top_line
  end

  def alpha_to_braille_middle(line)
    middle_line = ""
    line.each do |character|
      middle_line << @alpha.alpha_to_braille_middle(character)
    end
    middle_line
  end

  def alpha_to_braille_bottom(line)
    bottom_line = ""
    line.each do |character|
      bottom_line << @alpha.alpha_to_braille_bottom(character)
    end
    bottom_line
  end




end
