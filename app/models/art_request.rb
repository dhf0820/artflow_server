class ArtRequest < ApplicationRecord

  # has_and_belongs_to_many :product_types
  # accepts_nested_attributes_for :product_types, allow_destroy: false, reject_if: :all_blank
  #
  # has_many :attachments
  # accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank
  #
  # has_many :art_request_specifications
  belongs_to :customer #, required: true
  belongs_to :product #, optional: true
  belongs_to :sales_rep
  belongs_to :artist

  validates :customer_id, presence: true
  validates :product_id, presence: true

  # after_create    :create_product_art_request
  # before_update   :noupdate_product
  # before_destroy  :before_destroy

  has_one :card_art_request
  accepts_nested_attributes_for :card_art_request, allow_destroy: true, reject_if: :all_blank

  
  def self.search(flag,q)
    case flag 
      when "cust_name"
        joins(:customer).where("lower(customers.name) like (?)", "%#{q.downcase}%").order("id DESC")
      when "cust_id"
        joins(:customer).where("lower(customers.sage_id) like (?)", "%#{q.downcase}%").order("id DESC")
      when "art_id"
        where(id: q).order("id DESC")
      when "prod_id"
        []
      else
        []
    end
  end

  def product_art_request!
    request_class = product.product_request_class.constantize
    request_class.for_art_request!(self.id)
  end

  def product_art_request
    request_class = product.product_request_class.constantize
    request_class.for_art_request(self.id)
  end

  def requesting_customer=(new_customer)
    unless new_customer.class == Customer
      raise NotCustomerClassError.new('Customer is not a Customer Class', new_customer.class.to_s)
    end
    if new_customer.id == nil
      raise CustomerNotFoundError.new('Customer must be saved before attaching')
    end
    self.customer_id = new_customer.id
  end


  def requesting_customer
    raise CustomerNotFoundError.new('Customer has not been set yet') if customer == nil
    return customer
  end

  def ArtRequest.for_customer(id)
    request = ArtRequest.where(:customer_id => id)
    #request = ArtRequest.find(:all, :conditions => {customer_id => id})
    raise CustomerNotFoundError.new('Customer did not request ay art') if request.count == 0
    request
  end


  def ArtRequest.next(artist)
    # get return the active one if tehe is one
    next_request = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: artist.id, status: 'ACTIVE'}])
    return next_request[0] if next_request.count > 0
    #next_request = ArtRequest.where("status = 'PENDING'").order(created_at: :asc)
    next_request = ArtRequest.where(status: 'PENDING').order('created_at ASC')
    next_request[0]
  end


  def ArtRequest.held_requests(artist)
    # get return the active one if tehe is one
    held_list = ArtRequest.where(['artist_id = :artist_id and status = :status', {artist_id: artist.id, status: 'HOLD'}])
    return held_list
  end

  def ArtRequest.held_request!(artist, job_id)
    held_job = ArtRequest.where(['artist_id = :artist_id and id = :id', {artist_id: artist.id, id: job_id}])
    raise ActiveRecord::RecordNotFound if held_job.count == 0
    current_job = artist.current_job
    unless current_job.nil?
      current_job.status = 'HOLD'
      current_job.save
    end
    held_job[0].status = 'ACTIVE'
    held_job[0].save
    return held_job[0]
  end

  private

  # create the proper product_art_request for proper specs
  # Exampe.  If the request product is 'Casino Cards' then the product_art_request_class would be 'cards_art_request'.
  # create the record and put this record id in it
  def create_product_art_request
    request_class = product.product_request_class.constantize
    request = request_class.new(art_request_id: self.id)
    request.save!
  end

  # do not allow the distruction of an art request that still
  def before_destroy

  end

end


class NotCustomerClassError < StandardError

  def initialize(msg='Not a customer CLASS', data='')
    @data = data
    super(msg)
  end
end

class CustomerNotFoundError < StandardError
  attr_accessor :data
  def initialize(msg='Customer not found', data='')
    @data = data
    super(msg)
  end
end




