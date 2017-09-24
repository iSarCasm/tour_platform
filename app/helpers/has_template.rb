RailsAdmin::Config::HasFields.module_eval do
  attr_reader :template

  def set_template(name)
    @template ||= name
  end
end
