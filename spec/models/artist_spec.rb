require 'rspec'

describe 'Job Management' do
  let(:casino_card) {FactoryGirl.create(:casino_card)}
  let(:art_request) {FactoryGirl.build(:card)}
  let(:request)     {FactoryGirl.build(:card)}
  let(:wynn) {FactoryGirl.create(:wynn)}
  it 'returns current job' do
    artist = Artist.new(:name => 'Joe Artist')
    artist.save
    request.product_id = casino_card.id
    request.customer_id = wynn.id
    request.status = 'PENDING'

    request.save
    art_request.product_id = casino_card.id
    art_request.customer_id = wynn.id
    art_request.status = 'ACTIVE'
    art_request.artist = artist
    art_request.save
    expect(artist.current_job).to eql art_request
  end
  it 'returns nill if no current job' do
    artist = Artist.new(:name => 'Joe Artist')
    artist.save
    request.product_id = casino_card.id
    request.customer_id = wynn.id
    request.status = 'PENDING'

    request.save
    art_request.product_id = casino_card.id
    art_request.customer_id = wynn.id
    art_request.status = 'HOLD'
    art_request.artist = artist
    art_request.save
    expect(artist.current_job).to be_nil
  end
end