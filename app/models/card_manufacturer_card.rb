class CardManufacturerCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :card_manufacturer
end
