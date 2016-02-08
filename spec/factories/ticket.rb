require 'faker'

FactoryGirl.define do
  factory :ticket do |f|
    f.subject { Faker::Hipster.sentence(4) }
    f.content { Faker::Hipster.sentence(15) }
  end
end
