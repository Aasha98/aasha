class AddColumnToSalaries < ActiveRecord::Migration[6.0]
  def change
    add_column :salaries, :gross, :integer
  end
end
