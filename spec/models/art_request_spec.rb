require 'rspec'
#require 'not_customer_class_error'
#require 'rails_helper'


describe 'ArtRequest for Customer' do

  # before(:each) do
  #   @card = FactoryGirl.create(:casino_card)
  # end
  let (:unsaved_customer) {FactoryGirl.build(:gazorch)}
  let(:casino_card) {FactoryGirl.create(:casino_card)}
  let(:art_request) {FactoryGirl.build(:card)}
  let(:request)     {FactoryGirl.build(:card)}
  let(:wynn) {FactoryGirl.create(:wynn)}

  describe 'add customer to request' do
    context 'valid' do
      it 'will add saved customer' do
        art_request.customer = wynn
        expect(art_request.customer.id).to eq wynn.id
      end

    end

    context 'invalid' do
      it 'not a Customer Class' do
        expect{art_request.customer='junk'}.to raise_error(ActiveRecord::AssociationTypeMismatch)
      end
    end

    context 'save request' do
      context 'valid customer' do
        it 'will save'do
          art_request.product = casino_card
          art_request.customer = wynn
          expect{art_request.save!}.not_to raise_exception
          #card_req = CardArtRequest.find_by(art_request_id: art_request.id)
        end
      end


      context 'unsaved customer' do
        it 'will raise error with save!' do
          art_request.customer = unsaved_customer
          art_request.product = casino_card
          expect{art_request.save!}.to raise_error(ActiveRecord::RecordInvalid)
        end
        it 'will return false with save' do
          art_request.customer = unsaved_customer
          expect(art_request.save).to be false
        end
      end
    end
  end

  describe "request's Customer" do
    context 'is not set' do
      it 'will raise error if customer is not set' do
        expect(art_request.customer).to be nil
        #expect{art_request.customer}.to raise_error(CustomerNotFoundError)
      end
    end
    context 'is valid' do
      it 'will return customer making request' do
        art_request.customer = wynn
        expect(art_request.customer).to eq (wynn)
      end
    end
  end

  describe "Find customer's Requests" do
    context 'no requests' do
      it 'will raise error' do
        expect{ArtRequest.for_customer(wynn.id)}.to raise_error(CustomerNotFoundError)
      end
    end
    context 'one request' do
      it ' returns array of one' do
        art_request.customer = wynn
        art_request.product = casino_card
        art_request.save!

        puts  "Request.Count = #{ArtRequest.count}"

        reqs = ArtRequest.for_customer(wynn.id)
        expect(reqs.count).to eq 1
        expect(reqs[0]).to eq ( art_request)
      end
    end
    context 'multiple all requests' do
      it 'returns array of requests' do
        art_request.customer = wynn
        art_request.product = casino_card
        art_request.save!
        ar2 = FactoryGirl.build(:card, product_id: casino_card.id)
        ar2.requesting_customer = wynn
        art_request.product = casino_card
        ar2.save!
        reqs = ArtRequest.for_customer(wynn.id)
        expect(reqs.count).to eq 2
      end
    end
  end

  describe 'ArtRequest for Product' do
    describe 'add to request' do
      context 'exists' do
        it 'adds reference' do
          request = ArtRequest.new
          #request.requesting_customer = wynn
          request.product= casino_card
        end
      end
    end

    describe 'creates request' do
      it "creates a new art_request" do
        request = ArtRequest.new
        request.requesting_customer = wynn
        request.product= casino_card
      end
    end
    describe 'finds product_art_request' do
      it 'returns proper product_art_request' do
        request = ArtRequest.new
        request.requesting_customer = wynn
        request.product= casino_card
        request.save!
        par = request.product_art_request
        puts "par = #{par.inspect}"
      end

    end

  end

  describe 'Queue Management' do

    describe 'Return the next request' do
      context 'Artist already has an active request' do
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
          expect(ArtRequest.next(artist).id).to eql(art_request.id)
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
          expect(ArtRequest.next(artist).id).to eql(request.id)
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
          expect(ArtRequest.held_requests(artist).count).to eql 0
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
          expect(ArtRequest.held_requests(artist).count).to eql 2
        end
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
        expect{ArtRequest.held_request!(artist, request.id)}.to raise_error(ActiveRecord::RecordNotFound)
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
        held = ArtRequest.held_request!(artist, request.id)
        expect(held.id).to eql request.id
        expect(held.status).to eql 'ACTIVE'
        req = ArtRequest.find(req.id)
        expect(req.status).to eql 'HOLD'
      end
    end
  end
end


