class CreateCardPaperTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :card_paper_types do |t|
      t.string :name
      t.time :deleted_at
      t.timestamps
    end
    add_index(:card_paper_types, :name, unique: true)
    add_index(:card_paper_types, :deleted_at)
  end
end
