class Checklist < ActiveRecord::Base
  validates :name, :order, :content, presence: true
  
  def short_content 
    content.truncate(150)
  end
end
