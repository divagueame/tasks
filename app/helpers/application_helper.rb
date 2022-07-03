module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash', partial: 'layouts/flash'
  end

  def form_error_notification(obj)
    if obj.errors.any?
      tag.div class: 'error-message' do
        obj.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join('_')
  end

  def duration(seconds)
    ActiveSupport::Duration.build(60 * seconds).inspect
  end
end
