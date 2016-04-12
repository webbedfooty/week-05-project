# Name of Corporate Sponsor
# Value of Contract to Club (+) as an integer

class Sponsor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_and_belongs_to_many :clubs
end
