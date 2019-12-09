class AddTotalEarningsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_earnings, :string
    add_column :users, :total_deduction, :string
    add_column :users, :no_of_leave_taken, :string
  end
end
