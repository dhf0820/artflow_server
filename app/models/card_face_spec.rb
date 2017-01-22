class CardFaceSpec < ApplicationRecord
  belongs_to :card_art_request 
  enum status: [:preparing,
                :submitted,
                :started,
                :finished,
                :pending_approval,
                :art_approved,
                :submitted_compliance,
                :pending_compliance,
                :compliance_approved,
                :orderable,
                :hold,
                :discontinued
               ]

  def face_style
    CardFaceType.where(id: face_type_id).name
  end

  def CardFaceSpec.details(designs)
    #type = CardType.order(:name)  # if nonspecific CardType for a design uncomment this
    detail = {}
    detail[:prompt] = 'Face Style:'
    detail[:items] = []
    designs.each do |d|
      type = CardType.order(:name)  # if unspecific CardTypes for a design comment this and uncomment above
      des = {}
      des[:design] = d[:name]
      des[:items] = []
      type.each do |d|
        dt = {}
        dt[:name] = d.name
        dt[:id] = d.id
        des[:items] << dt
      end
      detail[:items] << des
    end
    detail
  end
end
