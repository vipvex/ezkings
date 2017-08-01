class Page < ActiveRecord::Base
  validates :name, :url, :order, presence: true
  
  scope :shown, -> { where(show: true) }
end
