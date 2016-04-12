# Name of Player
# Cost of Player to Club (-) as an integer

class Player < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0}

  belongs_to :club
end
