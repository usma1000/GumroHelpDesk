class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :tickets, dependent: :destroy
  belongs_to :carrier

  acts_as_commontator

  def full_name
    if first_name && last_name then
      [first_name, last_name].join " "
    elsif first_name && !last_name
      first_name
    elsif !first_name && last_name
      last_name
    else
      "No name"
    end
  end
end
