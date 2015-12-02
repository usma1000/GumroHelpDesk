class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :allopen, -> {where('status = 0 or status = 1')}
  scope :status, ->(status) {where("status = ?", status)}
  scope :priority, -> {where(priority: true)}
end
