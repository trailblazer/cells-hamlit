require 'test_helper'

class HamlTest < MiniTest::Test
  def test_template_engine
    assert_equal :haml, Cell::ViewModel.template_engine
  end
end
