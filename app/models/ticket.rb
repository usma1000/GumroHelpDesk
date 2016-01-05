class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  belongs_to :carrier

  enum status: [ :open, :waiting, :done, :trashed ]

  scope :allopen, -> {where('status = 0 or status = 1')}
  scope :priority, -> {where(priority: true)}
end
