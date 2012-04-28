module ApplicationHelper
  def bootstrap_alert_type(type)
    case type
    when :alert
      "error"
    when :error
      "error"
    when :notice
      "warning"
    when :success
      "success"
    else
      type.to_s
    end
  end
end
