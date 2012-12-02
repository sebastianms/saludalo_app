module ApplicationHelper

	def show_sessions
		"CAUSER_ID => #{session[:cause_id]}"
	end
end
