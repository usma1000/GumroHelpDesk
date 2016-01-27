class Store < ActiveRecord::Base
  belongs_to :location
  has_many :tickets

  validates :store, :presence => true
end
