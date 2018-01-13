module XlsReport
  def filename
    "#{name}.xls"
  end

  def write_content(book)
    xls_view_name = self.class.to_s.gsub('::', '') # Report::Xls => ReportXls
    unless self.class.const_defined?(xls_view_name)
      raise ArgumentError, "Could not find #{xls_view_name} for #{self.class}"
    end
    xls_view = self.class.const_get(xls_view_name)
    xls_view.new(locals).render(book)
  end

  def data
    data = StringIO.new
    book = Spreadsheet::Workbook.new
    write_content(book)
    book.write data
    data.string.force_encoding('binary')
  end

  def inline?
    false # All XLS served as attachment
  end
end
