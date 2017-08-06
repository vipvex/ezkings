class Page < ActiveRecord::Base
  validates :name, :url, :order, presence: true
  
  scope :shown, -> { where(show: true) }
  
  def short_content 
    content.truncate(150)
  end
end
