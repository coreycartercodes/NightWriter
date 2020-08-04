class TextToBraille
  attr_reader :text_to_braille

  def initialize
    @text_to_braille = {
      "a" => {top: "0.", middle: "..", bottom: ".."},
      "b" => {top: "0.", middle: "0.", bottom: ".."},
      "c" => {top: "00", middle: "..", bottom: ".."},
      "d" => {top: "00", middle: ".0", bottom: ".."},
      "e" => {top: "0.", middle: ".0", bottom: ".."},
      "f" => {top: "00", middle: "0.", bottom: ".."},
      "g" => {top: "00", middle: "00", bottom: ".."},
      "h" => {top: "0.", middle: "00", bottom: ".."},
      "i" => {top: ".0", middle: "0.", bottom: ".."},
      "j" => {top: ".0", middle: "00", bottom: ".."},
      "k" => {top: "0.", middle: "..", bottom: "0."},
      "l" => {top: "0.", middle: "0.", bottom: "0."},
      "m" => {top: "00", middle: "..", bottom: "0."},
      "n" => {top: "00", middle: ".0", bottom: "0."},
      "o" => {top: "0.", middle: ".0", bottom: "0."},
      "p" => {top: "00", middle: "0.", bottom: "0."},
      "q" => {top: "00", middle: "00", bottom: "0."},
      "r" => {top: "0.", middle: "00", bottom: "0."},
      "s" => {top: ".0", middle: "0.", bottom: "0."},
      "t" => {top: ".0", middle: "00", bottom: "0."},
      "u" => {top: "0.", middle: "..", bottom: "00"},
      "v" => {top: "0.", middle: "0.", bottom: "00"},
      "w" => {top: ".0", middle: "00", bottom: ".0"},
      "x" => {top: "00", middle: "..", bottom: "00"},
      "y" => {top: "00", middle: ".0", bottom: "00"},
      "z" => {top: "0.", middle: ".0", bottom: "00"},
      "!" => {top: "..", middle: "00", bottom: "0."},
      "\'" => {top: "..", middle: "..", bottom: "0."},
      "-" => {top: "..", middle: "..", bottom: "00"},
      "." => {top: "..", middle: "00", bottom: ".0"},
      "?" => {top: "..", middle: "0.", bottom: "00"},
      " " => {top: "..", middle: "..", bottom: ".."},
      "\"" => {top: "..", middle: ".0", bottom: "00"},
      "," => {top: "..", middle: "0.", bottom: ".."},
      ";" => {top: "..", middle: "0.", bottom: "0."},
      "\n" => "\n"
    }
  end

  def alpha_to_braille_top(char)
    if char == "\n"
      ".."
    else
      if @text_to_braille[char] == nil
        "X"
      else
        @text_to_braille[char][:top]
      end
    end
  end

  def alpha_to_braille_middle(char)
    if char == "\n"
      ".."
    else
      if @text_to_braille[char] == nil
        "X"
      else
        @text_to_braille[char][:middle]
      end
    end
  end

  def alpha_to_braille_bottom(char)
    if char == "\n"
      ".."
    else
      if @text_to_braille[char] == nil
        "X"
      else
        @text_to_braille[char][:bottom]
      end
    end
  end

end
