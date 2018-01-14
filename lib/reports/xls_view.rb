class XlsView
  attr_reader :locals

  def initialize(locals)
    @locals = locals
  end

  def method_missing(method, *_args)
    locals[method]
  end

  def render(_book)
    raise StandardError, "Method #render not defined for #{self.class}"
  end
end
