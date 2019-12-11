class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :net_pay, :integer
  end
end
