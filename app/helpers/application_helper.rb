module ApplicationHelper
  def errors_for(obj)
    return unless flash[:alert]
    flash[:alert][obj]&.join(', ')
  end
end
