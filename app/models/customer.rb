class Customer < ApplicationRecord
  require 'csv'
  acts_as_paranoid
  
  has_many :art_requests

  after_create do 
    self.sage_id = "TMP-#{id}" if sage_id.blank?
    self.save
  end 

  def self.by_sage_id(sage_id)
    where(sage_id: sage_id).first
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      @user = find_by_customer_no(row["CustomerNo"])

      customer_attributes = {name: row["CustomerName"], address1: row['AddressLine1'], address2: row['AddressLine2'], address3: row['zipcode'], zipcode: row['ZipCode'], customer_no: row['CustomerNo'], city: row['City'], state: row['State'], country_code: row['CountryCode'], sales_preson_no: row['SalespersonNo']}
      if @user.present?
      	 @user.update_attributes(customer_attributes)
      else
      	Customer.create!(customer_attributes)
      end
    end # end CSV.foreach
  end # end self.import(file)


end
