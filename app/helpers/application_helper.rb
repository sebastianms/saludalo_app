module ApplicationHelper

    def translate_status (status)
      case status
      when "pending"
        return "Pendiente"
      else
        return "Completada"
      end
    end

    def califications_icons(mark)
      html = ""
      5.times do |i|
        if i < mark 
          html << <<-HTML
            <i class="icon-star"></i>
          HTML
        else
          html << <<-HTML
            <i class="icon-star-empty"></i>
          HTML
        end
      end
      html.html_safe
    end

    def delete_session
      link_to_if(Rails.env.development?, 'Borrar Session', delete_session_path)
    end
end
