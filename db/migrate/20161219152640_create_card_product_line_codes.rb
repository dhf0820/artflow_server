class CreateCardProductLineCodes < ActiveRecord::Migration[5.0]    ## AT-AV
  def change
    create_table :card_product_line_codes do |t|
      t.string :code
      t.string :desc
      t.string :code_type
      t.datetime :deleted_at
      t.timestamps
    end
    add_index(:card_product_line_codes, :code, unique: true)
    add_index(:card_product_line_codes, :deleted_at)
  end
end
