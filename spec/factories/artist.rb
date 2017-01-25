

FactoryGirl.define do
  factory :email do |n|
    'test#{n}@example.com'
  end
  factory :pcf, class: Artist do
    name 'Preston French'
    short_name 'PCF'
    #email "#{short_name}@example.com"
    sequence(:email) {|n| "test#{n}@example.com"}

  end

  factory :dhf2, class: Artist do
    name 'Donald French II'
    short_name 'DHF2'
    email {Factory.next(:email)}
  end
end