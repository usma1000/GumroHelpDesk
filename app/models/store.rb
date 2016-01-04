class Store < ActiveRecord::Base
  belongs_to :location
  has_many :tickets
end
