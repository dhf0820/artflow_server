class CreateArtists < ActiveRecord::Migration[5.0]

  def change
    create_table :artists do |t|
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
      t.integer :user_id
      t.timestamps
    end
    add_index :artists, :name, unique: true
    add_index :artists, :short_name, unique: true
    add_index :artists, :user_id, unique: true
  end
end
