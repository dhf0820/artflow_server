class AddApprovedToFaceBackSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :card_face_specs, :art_approved_by, :string
    add_column :card_face_specs, :art_approved_date, :datetime
    add_column :card_face_specs, :compliance_approved_by, :string
    add_column :card_face_specs, :compliance_approved_date, :datetime
    add_column :card_face_specs, :compliance_approval, :string
    add_column :card_face_specs, :status, :integer, default: 0

    add_column :card_back_specs, :art_approved_by, :string
    add_column :card_back_specs, :art_approved_date, :datetime
    add_column :card_back_specs, :compliance_approved_by, :string
    add_column :card_back_specs, :compliance_approved_date, :datetime
    add_column :card_back_specs, :compliance_approval, :string
    add_column :card_back_specs, :status, :integer, default: 0
  end
end
