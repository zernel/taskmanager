class String

  def urlize
     self.downcase.gsub(/&/, 'and').gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')
  end

  def seoize
     self.titleize.gsub(/&/, 'and').gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')
  end

  def recover_url
    "#{self.gsub(/-/,'%')}"
  end

  def split_to_get_date
    year, month = split('-')
    Date.new(year.to_i, month.to_i)
  end
end
