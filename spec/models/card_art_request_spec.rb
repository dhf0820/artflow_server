require 'rspec'
require 'date'

describe 'CardArtRequest' do
  let (:unsaved_customer) {FactoryGirl.build(:gazorch)}
  let(:casino_card) {FactoryGirl.create(:casino_card)}
  let(:art_request) {FactoryGirl.build(:card)}
  let(:wynn) {FactoryGirl.create(:wynn)}

  it 'should should find by art_request_id' do
    art_request.customer = wynn
    art_request.product = casino_card
    art_request.save!
    expect{CardArtRequest.for_art_request(art_request)}.not_to raise_error
  end

  it 'should raise error in art_request_id not found' do
    art_request.id = 789 
    expect{CardArtRequest.for_art_request!(art_request)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'Should be able to add a face' do
    req = CardArtRequest.new
    spec = CardFaceSpec.new
    expect{req.add_face_spec(spec)}.not_to raise_error
  end

  it 'should return a list of face_specs on request' do
    req = CardArtRequest.new
    spec = CardFaceSpec.new
    req.add_face_spec(spec)
    spec = CardFaceSpec.new
    req.add_face_spec(spec)
    expect(req.face_specs.count).to eq 2
    expect(req.face_specs!.count).to eq 2
  end

  it 'should be able to add a back' do
    req = CardArtRequest.new
    spec = CardBackSpec.new
    expect{req.add_back_spec(spec)}.not_to raise_error
  end

  it 'should return a list of back_specs on request' do
    req = CardArtRequest.new
    spec = CardBackSpec.new
    req.add_back_spec(spec)
    spec = CardBackSpec.new
    req.add_back_spec(spec)
    expect(req.back_specs.count).to eq 2
    expect(req.back_specs!.count).to eq 2
  end

  it 'should be able to add a spec' do
    req = CardArtRequest.new
    spec = CardBackSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
    spec = CardFaceSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
  end

  it 'should return total specs' do
    req = CardArtRequest.new
    spec = CardBackSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
    spec = CardFaceSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
    expect(req.total_specs).to eq 2
  end

  it 'should return all specs on request' do
    req = CardArtRequest.new
    spec = CardBackSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
    spec = CardFaceSpec.new
    expect{req.add_spec(spec)}.not_to raise_error
    specs = req.specs
    expect(specs.count).to eq 2
    expect(specs[0].class).to eq CardBackSpec
    expect(specs[1].class).to eq CardFaceSpec

  end

  it 'should be able to delete an un approved spec spec' do
    req = CardArtRequest.new
    back = CardBackSpec.new
    expect{req.add_spec(back)}.not_to raise_error
    face = CardFaceSpec.new
    expect{req.add_spec(face)}.not_to raise_error
    expect{req.delete_spec(face)}.not_to raise_error
    expect(req.total_specs).to eq 1
  end

  it 'should NOT be able to delete an approved spec spec' do
    req = CardArtRequest.new
    back = CardBackSpec.new
    expect{req.add_spec(back)}.not_to raise_error
    face = CardFaceSpec.new(art_approved_date: DateTime.now)
    expect{req.add_spec(face)}.not_to raise_error
    expect{req.delete_spec(face)}.to raise_error(ArgumentError)
  end

end