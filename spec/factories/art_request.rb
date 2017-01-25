
FactoryGirl.define do
  factory :pending_base_card, class: ArtRequest do
    product_id {FactoryGirl.create(:casino_card).id}
    status 'PENDING'
    customer_id {FactoryGirl.create(:wynn).id}
  end

end