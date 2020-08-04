require "./test/test_helper"
require "./lib/text_to_braille"

class TextToBrailleTest < Minitest::Test

  def setup
    @dictionary = TextToBraille.new
  end

  def test_it_exists
    assert_instance_of TextToBraille, @dictionary
  end

  def test_it_calls
    expected1 = {top: "0.", middle: "..", bottom: ".."}
    expected2 = {top: "..", middle: "00", bottom: "0."}
    assert_equal expected1, @dictionary.text_to_braille["a"]
    assert_equal expected2, @dictionary.text_to_braille["!"]
  end

  def test_it_translates_letters
    assert_equal "0.", @dictionary.alpha_to_braille_top("a")
    assert_equal "..", @dictionary.alpha_to_braille_middle("a")
    assert_equal "..", @dictionary.alpha_to_braille_bottom("a")
  end

  def test_it_handles_unknowns
    assert_equal "X", @dictionary.alpha_to_braille_top("~")
    assert_equal "X", @dictionary.alpha_to_braille_middle("~")
    assert_equal "X", @dictionary.alpha_to_braille_bottom("~")
  end
end
