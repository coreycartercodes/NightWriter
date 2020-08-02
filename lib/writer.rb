require './lib/text_to_braille'

class Writer
  attr_reader :alpha,

  def initialize
    @alpha = TextToBraille.new
  end

  

  end
