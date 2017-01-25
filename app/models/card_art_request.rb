class CardArtRequest < ApplicationRecord
  belongs_to :art_request

  has_many :card_back_specs, foreign_key: 'card_set_id'
  accepts_nested_attributes_for :card_back_specs, allow_destroy: true, reject_if: :all_blank

  has_many :card_face_specs, foreign_key: 'card_set_id'
  accepts_nested_attributes_for :card_face_specs, allow_destroy: true, reject_if: :all_blank

  def CardArtRequest.for_art_request(art_request)
    request = CardArtRequest.where(:art_request_id => art_request)
    return nil if request.count == 0
    return request[0]
  end

  def CardArtRequest.for_art_request!(art_request)
    request = CardArtRequest.where(:art_request_id => art_request)
    raise ActiveRecord::RecordNotFound if request.count == 0
    request[0]
  end

  def CardArtRequest.where_with_details(where)

    request = CardArtRequest.where(where)
    puts "Getting all the specs"
    request.all_specs
    request
  end

  def CardArtRequest.details()
    items = []
    designs = CardDesignType.details
    des = designs[:items]
    items << designs
    items << CardStockType.details(des)
    items << CardType.details(des)
    return items
    # #detail = {:name => 'Casino Cards', :items => []}
    # detail = {}
    # detail[:items] = []
    # designs = CardDesignType.details
    # items = designs[:items]
    # detail[:items] << designs
    # detail[:items] << CardStockType.details(items)
    # detail[:items] << CardType.details(items)
    # items
    #
    # detail

  end

  def all_specs
    self.card_face_specs = self.face_specs
    self.card_back_specs = self.back_specs
    puts self.card_back_specs
    puts self.card_face_specs
  end

  def add_face_spec(spec)
    raise ArgumentError.new('not a face spec') if spec.class != CardFaceSpec
    spec.art_set_id = self.id
    spec.save!
  end

  def add_back_spec(spec)
    raise ArgumentError.new('not a back spec') if spec.class != CardBackSpec
    spec.art_set_id = self.id
    spec.save!
  end

  def face_specs
    faces = CardFaceSpec.where( card_set_id: self.id)
    return faces
  end

  def face_specs!
    specs = CardFaceSpec.where( card_set_id: self.id)
    raise ActiveRecord::RecordNotFound if specs.count == 0
    return specs
  end

  def back_specs
    specs = CardBackSpec.where( card_set_id: self.id)
    return specs
  end

  def back_specs!
    specs = CardBackSpec.where( card_set_id: self.id)
    raise ActiveRecord::RecordNotFound if specs.count == 0
    return specs
  end

  def add_spec(spec)
    if spec.class == CardBackSpec
      add_back_spec(spec)
    elsif spec.class == CardFaceSpec
      add_face_spec(spec)
    else
      raise ArgumentError.new("Spec [#{spec.class} argument is not a back or a face")
    end
  end


  def delete_spec(spec)
    raise ArgumentError.new('Can not delete approved side specifications') unless spec.art_approved_date.nil?
    spec.delete
  end

  def total_specs
    specs = CardBackSpec.where( card_set_id: self.id).count
    specs += CardFaceSpec.where( card_set_id: self.id).count
    specs
  end

  def specs
    specs = CardBackSpec.where( card_set_id: self.id)
    specs += CardFaceSpec.where( card_set_id: self.id)
    specs
  end



  def card_stock_detail
    begin
      CardStockType.find(self.card_stock_id)
    rescue
      nil
    end
  end

  def card_stock
    begin
      CardStockType.find(self.card_stock_id).name
    rescue
      'Undefined'
    end
  end

  def card_stock=(id)
    begin
      cs = CardStockType.find id
      self.card_stock_id = id
      cs
    rescue
      puts "CardStock #{id} is invalid"
      nil
    end
  end


  def submitted_specs
    art_request_specifications.where(status: "submitted")
  end
  
  def submitted_spec_count
    #submitted_specs.count
    3
  end
  
  def inprogress_specs
    art_request_specifications.where(status: "inprogress")
  end
  
  def inprogress_spec_count
    4 #inprogress_specs.count
  end
  
  def art_finished_specs
    art_request_specifications.where(status: "art_finished")
  end
  
  def art_finished_spec_count
    5#art_finished_specs.count
  end
  
  def pending_approval_specs
    art_request_specifications.where(status: "pending_approval")
  end
  
  def pending_approval_spec_count
    4#pending_approval_specs.count
  end
  
  def art_approved_specs
    art_request_specifications.where(status: "art_approved")
  end
  
  def art_approved_spec_count
    3#art_approved_specs.count
  end
  
  def printed_specs
    art_request_specifications.where(status: "printed")
  end
  
  def printed_spec_count
    4#printed_specs.count
  end
  
  def shipped_specs
    art_request_specifications.where(status: "shipped")
  end
  
  def shipped_spec_count
    5#shipped_specs.count
  end
  
  def completed_specs
    art_request_specifications.where(status: "completed")
  end
  
  def completed_spec_count
    4#completed_specs.count
  end


  private
  def CardArtRequest.detail(name, id)
    dt = {}
    dt[:name] = name
    dt[:id] = id
    dt[:prompt] = 'Card Stock:'
    dt[:data] = []
    dt
  end
end
