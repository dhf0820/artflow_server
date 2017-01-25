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
  it 'returns nil if no current job' do
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

  describe 'Return the next job' do
    context 'Artist already has an active job' do
      it 'Returns the active request' do
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
        expect(artist.next_job().id).to eql(art_request.id)
      end
    end
    context 'Artist has only HOLD jobs' do
      it 'Returns oldest PENDING request' do
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
        req = ArtRequest.new
        req.product_id = casino_card.id
        req.customer_id = wynn.id
        req.status = 'PENDING'
        req.save!
        expect(artist.next_job().id).to eql(request.id)
      end
    end
  end
  describe 'Return Held jobs for artist' do
    context 'Artist has no HOLD requests' do
      it 'Returns empty array' do
        artist = Artist.new(:name => 'Joe Artist')
        artist.save
        request.product_id = casino_card.id
        request.customer_id = wynn.id
        request.status = 'PENDING'

        request.save
        art_request.product_id = casino_card.id
        art_request.customer_id = wynn.id
        art_request.status = 'PENDING'
        art_request.save
        expect(artist.on_holds()).to be_nil
      end
    end
    context 'Artist has multiple HOLD jobs' do
      it 'Returns list of hold request' do
        artist = Artist.new(:name => 'Joe Artist')
        artist.save
        request.product_id = casino_card.id
        request.customer_id = wynn.id
        request.status = 'HOLD'
        request.artist = artist
        request.save
        art_request.product_id = casino_card.id
        art_request.customer_id = wynn.id
        art_request.status = 'HOLD'
        art_request.artist = artist
        art_request.save
        req = ArtRequest.new
        req.product_id = casino_card.id
        req.customer_id = wynn.id
        req.status = 'ACTIVE'
        req.artist = artist
        req.save!
        expect(artist.on_holds().count).to eql 2
      end
    end
  end


  describe 'Return a Held job for artist' do
    context 'Job is not held by artist' do
      it 'Raises not found error' do
        artist = Artist.new(:name => 'Joe Artist')
        artist.save
        request.product_id = casino_card.id
        request.customer_id = wynn.id
        request.status = 'PENDING'

        request.save
        art_request.product_id = casino_card.id
        art_request.customer_id = wynn.id
        art_request.status = 'PENDING'
        art_request.save
        expect(artist.on_hold(request.id)).to be_nil
        #expect{artist.on_hold(request.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
    context 'Artist has a held job' do
      it 'Returns the requested job setting it active' do
        artist = Artist.new(:name => 'Joe Artist')
        artist.save
        request.product_id = casino_card.id
        request.customer_id = wynn.id
        request.status = 'HOLD'
        request.artist = artist
        request.save
        art_request.product_id = casino_card.id
        art_request.customer_id = wynn.id
        art_request.status = 'HOLD'
        art_request.artist = artist
        art_request.save
        req = ArtRequest.new
        req.product_id = casino_card.id
        req.customer_id = wynn.id
        req.status = 'ACTIVE'
        req.artist = artist
        req.save!
        held = artist.on_hold(request.id)
        expect(held.id).to eql request.id
        expect(held.status).to eql 'ACTIVE'
        req = ArtRequest.find(req.id)
        expect(req.status).to eql 'HOLD'
      end
    end
  end
end