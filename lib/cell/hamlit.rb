require "cells"
require "hamlit"

module Cell
  module Hamlit
    def template_options_for(_options)
      {
        escape_html:    false,
        template_class: ::Hamlit::Template,
        suffix:         "haml"
      }
    end
  end

  class Cell::ViewModelHamlit < Cell::ViewModel
    include Cell::Hamlit
  end
end
