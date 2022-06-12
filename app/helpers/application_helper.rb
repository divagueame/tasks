module ApplicationHelper
    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/flash"
    end

    def form_error_notification(obj)
        if obj.errors.any?
            tag.div class: "error-message" do
                obj.errors.full_messages.to_sentence.capitalize
            end
        end
    end
end
