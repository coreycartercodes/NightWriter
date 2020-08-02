require './lib/text_to_braille'

class Writer
  attr_reader :alpha

  def initialize
    @alpha = TextToBraille.new
  end

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
    top = braille_top_line(line)
    middle = braille_middle_line(line)
    bottom = braille_bottom_line(line)
    braille_line = "#{top}\n#{middle}\n#{bottom}\n"
  end

  def write_text_line
  end

end
