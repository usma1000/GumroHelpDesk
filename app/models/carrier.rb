class Carrier < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :users
  has_many :tickets

  validates :name, :presence => true

  def associated_stores
    stores = []
    locations.each do |l|
      l.stores.each do |s|
        stores << s
      end
    end
    return stores
  end
end
