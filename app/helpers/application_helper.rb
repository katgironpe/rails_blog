module ApplicationHelper
  def site_title
    ENV['SITE_TITLE'] || "A Rails Blog"
  end

  def site_description
    ENV['SITE_DESCRIPTION'] || "Your Blog Description"
  end

  def alert_message(message, type = 'info')
    %(
      <div class="alert alert-#{type}" role="alert">
        #{message}
      </div>
    )
  end
end
