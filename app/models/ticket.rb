class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  belongs_to :carrier
  belongs_to :linehaul

  acts_as_commontable

  validates :subject, :presence => true
  validates :content, :presence => true

  enum status: [ :open, :waiting, :done, :trashed ]

  scope :allopen, -> {where('status = 0 or status = 1')}
  scope :priority, -> {where(priority: true)}
  
end
