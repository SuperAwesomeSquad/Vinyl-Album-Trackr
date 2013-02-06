module ApplicationHelper
	def alertStyleClassGenerator(alert)
		case alert
		  when :alert then "alert alert-error"
		  when :notice then "alert alert-success"
		  else "alert alert-notice"
		end
	end
end
