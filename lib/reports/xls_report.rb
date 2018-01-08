module XlsReport
  def filename
    "#{name}.xls"
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
