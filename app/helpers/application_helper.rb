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

    def califications_icons(mark)
      case mark
      when 1
        html = <<-HTML
            <i class="icon-star-empty"></i>
        HTML
        html.html_safe
      when 2
        html = <<-HTML
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
        HTML
        html.html_safe

      when 3
        html = <<-HTML
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
        HTML
        html.html_safe

      when 4
        html = <<-HTML
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
        HTML
        html.html_safe

      when 5
        html = <<-HTML
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
        HTML
        html.html_safe
      end
    end
end
