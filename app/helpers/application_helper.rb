module ApplicationHelper
  def site_title
    ENV['SITE_TITLE'] || "A Rails Blog"
  end

  def site_description
    ENV['SITE_DESCRIPTION'] || "Your Blog Description"
  end

  def page_title
    @title ||= site_title
  end

  def alert_message(message, type = 'info')
    %(
      <div class="alert alert-#{type}" role="alert">
    #{message}
      </div>
    )
  end

  def to_html(text)
    render_options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
    }

    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
