class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :status, ->(status) {where("status = ?", status)}
  scope :priority, ->(priority) {where("priority = ?", priority)}
end
