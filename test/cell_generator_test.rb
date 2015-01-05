require 'test_helper'
require 'rails/generators/test_case'
require 'rails/generators/cell/cell_generator'

class CellGeneratorTest < Rails::Generators::TestCase
  tests Rails::Generators::CellGenerator
  destination File.expand_path('../../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'create the standard assets' do
    run_generator %w(blog post latest)

    assert_file 'app/cells/blog_cell.rb', /class BlogCell < Cell::ViewModel/
    assert_file 'app/cells/blog_cell.rb', /def post/
    assert_file 'app/cells/blog_cell.rb', /def latest/
    assert_file 'app/cells/blog/post.haml', %r{app/cells/blog/post\.haml}
    assert_file 'app/cells/blog/post.haml', %r{<p>}
    assert_file 'app/cells/blog/latest.haml', %r{app/cells/blog/latest\.haml}
  end

  test 'create cell that inherits from custom cell class if specified' do
    run_generator %w(Blog --parent=ApplicationCell)
    assert_file 'app/cells/blog_cell.rb', /class BlogCell < ApplicationCell/
  end

  test 'work with namespaces' do
    run_generator %w(blog/post latest)
    assert_file 'app/cells/blog/post_cell.rb', /class Blog::PostCell < Cell::ViewModel/
    assert_file 'app/cells/blog/post_cell.rb', /def show/
    assert_file 'app/cells/blog/post_cell.rb', /def latest/
    assert_file 'app/cells/blog/post/latest.haml', %r{app/cells/blog/post/latest\.haml}
  end

  test 'work with namespaces and haml' do
    run_generator %w(blog/post latest)
    assert_file 'app/cells/blog/post_cell.rb', /class Blog::PostCell < Cell::ViewModel/
    assert_file 'app/cells/blog/post/latest.haml', %r{app/cells/blog/post/latest\.haml}
  end
end
