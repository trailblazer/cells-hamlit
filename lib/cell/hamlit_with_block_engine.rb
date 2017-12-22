require "cells"
require "hamlit"

module Cell
  module HamlitWithBlockEngine
    def self.included(_base)
      # Avoid requiring hamlit/block on
      # module definition stage since this lib might not exist
      require "hamlit/block"
    rescue LoadError
      raise NotImplementedError.new(
        "gem `hamlit-block` is required for using this module",
      )
    end

    def template_options_for(_options)
      {
        escape_html:    false,
        template_class: ::Hamlit::Block::Template,
        suffix:         "haml"
      }
    end

    # From FormTagHelper. why do they escape every possible string? why?
    def form_tag_in_block(html_options, &block)
      content = capture(&block)
      form_tag_with_body(html_options, content)
    end

    def form_tag_with_body(html_options, content)
      "#{form_tag_html(html_options)}" << content.to_s << "</form>"
    end

    # with fine Hamlit, we don't need magical output buffers since yielding a block returns the
    # content.
    def with_output_buffer(_block_buffer=nil)
      yield
    end

    def capture(*args)
      yield(*args)
    end

    def content_tag(name, content_or_options_with_block=nil, options=nil, escape=false, &block)
      super
    end
  end

end
