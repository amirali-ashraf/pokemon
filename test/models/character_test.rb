require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  setup do
    @character = characters(:one)
  end


  test "total value evaluate" do
    assert_equal 12, @character.total_score
  end
end
