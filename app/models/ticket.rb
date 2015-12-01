class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :status, ->(status) {where("status = ?", status)}
end
