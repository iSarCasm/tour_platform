require_dependency 'pdf_report'
require_dependency 'xls_report'

class Report
  attr_reader :object

  def self.[](format)
    format = format.to_s
    name = "#{self}::#{format.capitalize}"
    unless const_defined?(name)
      raise ArgumentError, "#{name} not found. Unknown format #{format} for report #{self}"
    end
    const_get(name)
  end

  def self.responds_to_format(format)
    format_class = Class.new(self) do
      format_module_name = format.to_s.capitalize + 'Report'
      unless const_defined?(format_module_name)
        raise ArgumentError, "#{format_module_name} not found. #{format} format of reports is not supported."
      end
      include const_get(format_module_name)
    end
    const_set(format.to_s.capitalize, format_class)
  end

  def initialize(object)
    @object = object
  end

  def inline?
    raise StandardError, "#inline? not defined for #{self.class}"
  end
end
