module ApplicationHelper
  def errors_for(obj)
    return unless flash[:error]
    flash[:error][obj]&.join(', ')
  end
end
