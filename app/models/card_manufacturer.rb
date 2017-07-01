class CardManufacturer < ActiveRecord::Base
  has_many :card_manufacturer_cards
end
