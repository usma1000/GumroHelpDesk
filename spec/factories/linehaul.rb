require 'faker'

FactoryGirl.define do
  factory :linehaul do |f|
    f.route { Faker::Company.name }
  end
end
