class Linehaul < ActiveRecord::Base
  has_many :tickets

  validates :route, :presence => true
end
