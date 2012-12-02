module ApplicationHelper

	def show_sessions
		"CAUSE_ID => #{session[:cause_id]}"
	end
end
