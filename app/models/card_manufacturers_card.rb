class CardManufacturersCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :card_manufacturers
end
