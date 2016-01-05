class Carrier < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :users
  has_many :tickets
end
