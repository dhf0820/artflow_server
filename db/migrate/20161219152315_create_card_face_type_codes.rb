class CreateCardFaceTypeCodes < ActiveRecord::Migration[5.0]  ## Columns AP-AR
  def change
    create_table :card_face_type_codes do |t|
      t.string  :code
      t.string  :desc
      t.string  :number
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_face_type_codes, :code, unique: true)
    add_index(:card_face_type_codes, :deleted_at)
  end
end
