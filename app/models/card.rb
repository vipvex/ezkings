class Card < ActiveRecord::Base
  validates :name, :year, :description, :price, :available, :serial_number, :sku, presence: true
  
  has_many :card_attributes, dependent: :destroy
  has_many :card_manufacturer_cards, dependent: :destroy
  has_many :card_teams, dependent: :destroy
  has_many :card_players, dependent: :destroy
  has_many :card_highlights, dependent: :destroy
  
  
  has_many :c_attributes, :through => :card_attributes, class_name: 'Attribute'
  has_many :card_manufacturers, :through => :card_manufacturer_cards, class_name: 'CardManufacturer'
  has_many :teams, :through => :card_teams
  has_many :players, :through => :card_players

  def available?
    self.available > 0
  end
  
  def player_name
    players.first.try(:name)
  end
  
end
