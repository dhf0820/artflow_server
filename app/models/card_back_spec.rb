class CardBackSpec < ApplicationRecord
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

  def back_style
    CardBackType.where(id: back_type_id).name
  end
end
