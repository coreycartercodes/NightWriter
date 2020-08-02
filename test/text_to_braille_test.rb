require "./test/test_helper"
require "./lib/text_to_braille"

class TextToBrailleTest < Minitest::Test

  def test_it_exists
    dictionary = TextToBraille.new
    assert_instance_of TextToBraille, dictionary
  end

  def test_it_calls
    dictionary = TextToBraille.new
    assert_equal {top: "0.", middle: "..", bottom: ".."}, dictionary.text_to_braille["a"]
    assert_equal {top: "..", middle: "00", bottom: "0."}, dictionary.text_to_braille["!"]
  end

end

dictionary = TextToBraille.new

dictionary.alpha_to_braille("h")
