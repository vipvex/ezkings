class CardTeam < ActiveRecord::Base
  belongs_to :card
  belongs_to :team
end
