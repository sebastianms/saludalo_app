module ApplicationHelper

	def show_sessions
		"CAUSE_ID => #{session[:cause_id]}"
	end

    def translate_status (status)
      case status
      when "pending"
        return "Pendiente"
      else
        return "Completada"
      end
    end
end
