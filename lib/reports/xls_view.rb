class XlsView
  attr_reader :locals

  def initialize(locals)
    @locals = locals
  end

  def method_missing(method, *args)
    locals[method]
  end

  def render(book)
    raise StandardError, "Method #render not defined for #{self.class.to_s}"
  end
end
