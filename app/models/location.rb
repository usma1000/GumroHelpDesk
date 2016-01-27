class Location < ActiveRecord::Base
  belongs_to :carrier
  has_many :stores, dependent: :destroy

  validates :name, :presence => true
end
