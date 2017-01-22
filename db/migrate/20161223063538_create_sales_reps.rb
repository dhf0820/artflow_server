class CreateSalesReps < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_reps do |t|
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
    end
    add_index(:sales_reps, :name)
    add_index(:sales_reps, :short_name, unique: true)
  end
end
