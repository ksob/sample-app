FactoryGirl.define do
  factory :menu do
    event {'BREAKFAST'}
    venue {"COMMERCIAL"}
    place {'"HOT SPRINGS, AR"'}
    date  {Faker::Date.between(100.years.ago, 90.years.ago)}
  end
end
