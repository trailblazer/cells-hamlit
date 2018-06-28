class SongCell < Cell::ViewModelHamlit
  self.view_paths = ["test/cells"]

  def render_in_render
    render
  end

  def render_in_render_2
    render
  end
end
