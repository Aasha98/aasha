class AddLeavesToSalaries < ActiveRecord::Migration[6.0]
  def change
    add_column :salaries, :no_of_leave_taken, :integer
  end
end
