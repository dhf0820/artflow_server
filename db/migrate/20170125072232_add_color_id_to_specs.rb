class AddColorIdToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :card_face_specs, :card_color_id, :integer
    add_column :card_back_specs, :card_color_id, :integer
  end
end
