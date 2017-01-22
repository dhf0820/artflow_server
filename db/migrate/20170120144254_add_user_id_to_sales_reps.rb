class AddUserIdToSalesReps < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_reps, :user_id, :integer
    add_index :sales_reps, :user_id, unique: true
  end
end
