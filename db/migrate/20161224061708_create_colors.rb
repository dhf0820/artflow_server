class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :c
      t.string :y
      t.string :m
      t.string :k
      t.string :pms_color
      t.time   :deleted_at
      t.boolean :user_generated, default: false
      t.timestamps
    end
    add_index(:colors, :name, unique: true)
  end
end
