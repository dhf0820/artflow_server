class CreateCardStockTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_stock_types do |t|
      t.string :name
      t.string :code
      t.integer :number
      t.time    :deleted_at
      t.timestamps
    end
    add_index(:card_stock_types, :name, unique: true)
    add_index(:card_stock_types, :deleted_at)
  end
end
