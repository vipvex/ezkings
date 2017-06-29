class CardAttribute < ActiveRecord::Base
  belongs_to :card
  belongs_to :c_attribute, :class_name => 'Attribute', :foreign_key => "attribute_id"
end
