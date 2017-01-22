# this entry replaces the CardartRequest in the spec
class CreateCustomerCard< ActiveRecord::Migration[5.0]
  def change
    create_table :customer_card do |t|
      t.integer  :customer_id
      t.string   :name
      t.string   :part_number
      t.integer  :face_id
      t.integer  :back_id
      t.integer  :packaging_id
      t.text     :production_notes
      t.text     :shipping_notes
      t.time     :deleted_at
      t.timestamp
    end
    add_index(:customer_card, [:customer_id, :part_number], unique: true)
    add_index(:customer_card, :face_id)
    add_index(:customer_card, [:customer_id, :name], unique: true)
    add_index(:customer_card, :deleted_at)
  end
end
