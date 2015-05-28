require 'tilt/haml'

module Cell
  module Haml
    # From FormTagHelper. why do they escape every possible string? why?
    def form_tag_in_block(html_options, &block)
      content = capture(&block)
      form_tag_with_body(html_options, content)
    end

    def form_tag_with_body(html_options, content)
      "#{form_tag_html(html_options)}" << content.to_s << "</form>"
    end

    def form_tag_html(html_options)
      extra_tags = extra_tags_for_form(html_options)
      "#{tag(:form, html_options, true) + extra_tags}"
    end

    def form_for(*args, &block) # TODO: remove this once Haml 4.1 is out. the form_for_with_haml is buggy.
      form_for_without_haml(*args, &block)
    end
  end

  ViewModel.template_engine = :haml
end