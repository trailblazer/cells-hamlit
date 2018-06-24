require "test_helper"

class HamlTest < MiniTest::Spec
  let(:song_cell) { SongCell.new }

  # Why haml add a line return in the end of tag ?
  it("render nested cells") do
    assert_equal "<b>Questions: <strong>Yes!</strong>\n</b>\n", song_cell.(:render_in_render)
  end
end
