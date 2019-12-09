class AddSelectMonthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :select_month, :string
  end
end
