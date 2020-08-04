require "./test/test_helper"
require "./lib/braille_to_text"

class BrailleToTextTest < Minitest::Test

  def setup
    @dictionary = BrailleToText.new
  end

  def test_it_exists
    assert_instance_of BrailleToText, @dictionary
  end

  def test_it_calls
    expected1 = "a"
    expected2 = "!"
    assert_equal expected1, @dictionary.translate_braille_character([["0."], [".."], [".."]])
    assert_equal expected2, @dictionary.translate_braille_character([[".."], ["00"], ["0."]])
  end

end
