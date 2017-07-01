class Card < ActiveRecord::Base
  has_many :card_attributes
  has_many :card_manufacturer_cards
  has_many :card_teams
  has_many :card_players
  
  
  has_many :c_attributes, :through => :card_attributes, class_name: 'Attribute'
  has_many :card_manufacturers, :through => :card_manufacturer_cards, class_name: 'CardManufacturer'
  has_many :teams, :through => :card_teams
  has_many :players, :through => :card_players
  
  
end
