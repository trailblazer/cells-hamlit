require "cells"
require "hamlit"

module Cell
  module Hamlit
    def template_options_for(options)
      {
        escape_html:    false,
        template_class: ::Hamlit::Template,
        suffix:         "haml",
        buffer:         '@output_buffer',
      }
    end

    # include ActionView::Helpers::FormHelper

    # From FormTagHelper. why do they escape every possible string? why?
    def form_tag_in_block(html_options, &block)
      content = capture(&block)
      form_tag_with_body(html_options, content)
    end

    def form_tag_with_body(html_options, content)
      "#{form_tag_html(html_options)}" << content.to_s << "</form>"
    end

    def with_output_buffer(block_buffer=ViewModel::OutputBuffer.new)
      @output_buffer, old_buffer = block_buffer, @output_buffer
      yield
      block_buffer
    ensure
      @output_buffer = old_buffer
    end

    def capture(*args)
      value = nil
      buffer = with_output_buffer { value = yield(*args) }
      buffer.to_s if buffer.size > 0
      value
    end

    def render_template(*)
      old_output_buffer = @output_buffer
      super
    ensure
      @output_buffer = old_output_buffer
    end

    # def form_tag_html(html_options)
    #   extra_tags = extra_tags_for_form(html_options)
    #   "#{tag(:form, html_options, true) + extra_tags}"
    # end

    # def form_for(*args, &block) # TODO: remove this once Haml 4.1 is out. the form_for_with_haml is buggy.
    #   form_for_without_haml(*args, &block)
    # end

    def content_tag(name, content_or_options_with_block=nil, options=nil, escape=false, &block)
      super
    end
  end
end
