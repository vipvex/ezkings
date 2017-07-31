class Page < ActiveRecord::Base
  validates :name, :url, :content, :show, presence: true
end
