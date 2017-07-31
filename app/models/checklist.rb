class Checklist < ActiveRecord::Base
  validates :name, :order, :content, presence: true
end
