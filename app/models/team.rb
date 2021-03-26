class Team < ApplicationRecord
    belongs_to :user 
    belongs_to :pokemon 
    validates_presence_of :name
end
