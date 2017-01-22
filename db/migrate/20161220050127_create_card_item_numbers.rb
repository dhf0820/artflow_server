class CreateCardItemNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :card_item_numbers do |t|
      t.string :item_number
      t.string :desc
      t.string :product_line
      t.string :base
      t.time :deleted_at
      t.timestamps
    end
    add_index(:card_item_numbers, :item_number, unique:true)
    add_index(:card_item_numbers, :product_line)
    add_index(:card_item_numbers, :deleted_at)
  end
end
