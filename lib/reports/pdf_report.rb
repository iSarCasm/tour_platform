module PdfReport
  def filename
    "#{name}.pdf"
  end

  def layout
    view_filename = self.class.to_s.split('::').first.underscore + '.pdf.html'
    "#{Rails.root}/app/reports/views/#{view_filename}"
  end

  def inline?
    true
  end
end
