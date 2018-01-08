class Report
  attr_reader :object

  def self.[](format)
    format = format.to_s
    name = "#{self.to_s}::#{format.capitalize}"
    unless const_defined?(name)
      raise ArgumentError, "#{name} not found. Unknown format #{format} for report #{self.to_s}"
    end
    const_get(name)
  end

  def initialize(object)
    @object = object
  end

  def inline?
    true
  end
end
