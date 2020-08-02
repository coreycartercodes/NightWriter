require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/text_to_braille"

class TextToBrailleTest < Minitest::Test

  def test_it_exists
    dictionary = TextToBraille.new
    assert_instance_of TextToBraille, dictionary
  end

  def test_it_calls
    dictionary = TextToBraille.new
    assert_equal ["0.","..",".."], dictionary.text_to_braille["a"]
    assert_equal ["..","00","0."], dictionary.text_to_braille["!"]
  end

end

dictionary = TextToBraille.new

puts "{#{dictionary.text_to_braille["c"]}#{dictionary.text_to_braille["o"]}"
print dictionary.text_to_braille["r"]
print dictionary.text_to_braille["e"]
puts dictionary.text_to_braille["y"]
p dictionary.text_to_braille["y"]
