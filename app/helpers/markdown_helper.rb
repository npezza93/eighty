module MarkdownHelper
  include SanitizeHelper

  def markdown(note)
    renderer = HTMLWithPygments.new(hard_wrap: true, filter_html: true)

    Sanitize.fragment(
      render_markdown(renderer, note), sanitization_filter
    ).html_safe
  end

  def standard_markdown(note)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)

    Sanitize.fragment(
      render_markdown(renderer, note), sanitization_filter(elements - %w(hr))
    ).html_safe
  end

  private

  def render_markdown(renderer, note)
    Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    ).render(note.content.to_s)
  end
end
