# Name of Club
# City Location
# Value as computed by Sponsorships and Player costs
#   CV = S - P; as an integer

class Club < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :city, presence: true

  has_and_belongs_to_many :sponsors
  has_many :players
end
