require "hamlit"

module Cell
  module Hamlit
    def template_options_for(options)
      {
        escape_html:    false,
        template_class: ::Hamlit::Template,
        suffix:         "haml"
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

    # with fine Hamlit, we don't need magical output buffers since yielding a block returns the
    # content.
    def with_output_buffer(block_buffer=ViewModel::OutputBuffer.new)
      yield
    end

    def capture(*args)
      yield(*args)
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
