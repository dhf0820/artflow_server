


FactoryGirl.define do
  factory :bridge, class: CardType do
    name 'Bridge'
  end

  factory :poker, class: CardType do
    name 'Poker'
  end

  factory :proflex, class: CardType do
    name 'Plastic Proflex Bridge'
  end
end