class Tax < ActiveRecord::Base
  def self.tax
    Tax.first.tax || 10
  end
  
  def self.tax_dec
    Tax.first.tax / 100.0
  end
end
