module ApplicationHelper
  def commaListOfUsersFromAlbum(users)
    user_list = []
    users.each do |u|
      user_list << u.email
    end
    user_list.join(", ")
  end
	def alertStyleClassGenerator(alert)
		case alert
    when :alert, :error then "alert alert-error"
    when :notice, :success then "alert alert-success"
    when :warning then "alert alert-warning"
    when :info then "alert alert-info"
    else "alert alert-notice"
    end
  end
  def currentPageActiveClass(short_path)
    "class='active'".html_safe if short_path == request.path
  end
  def diagnosticInformation
    if Rails.env == "development"
      diagnostics = '<hr/><div class="row">
      <div class="span12">
      <h5 class="muted">Diagnostic Information</h5>
      <ul class="unstyled">'
      diagnostics << "<li>Request path: #{request.path}</li>"
      diagnostics << "<li>Rails Environment: #{Rails.env}</li>"
      diagnostics << "<li>Params: #{params}</li>"
      diagnostics << '</ul>'
      diagnostics.html_safe
    else
      "<!-- production -->".html_safe
    end
  end
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Celluloid").join(" - ")
      end
    end
  end
end
