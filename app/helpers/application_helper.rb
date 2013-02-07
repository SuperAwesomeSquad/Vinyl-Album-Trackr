module ApplicationHelper
	def alertStyleClassGenerator(alert)
		case alert
    when :alert then "alert alert-error"
    when :notice then "alert alert-success"
    else "alert alert-notice"
    end
  end
  def navLinkGenerator(short_path)
    link = '<li'
    link << " class='active'" if short_path == request.path
    link << '>'
    link << yield
    link.html_safe
  end
  def diagnosticInformation
    if Rails.env == "development"
        diagnostics = '<hr/><div class="row">
      <div class="span12">
      <h5 class="muted">Diagnostic Information</h5>
      <ul class="unstyled">'
      diagnostics << "<li>Request path: #{request.path}</li>"
      diagnostics << "<li>Rails Environment: #{Rails.env}</li>"
      diagnostics << '</ul>'
      diagnostics.html_safe
    else
      "<!-- production -->".html_safe
    end
  end
end
