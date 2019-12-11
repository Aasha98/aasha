class AddBankAccNumToSalaries < ActiveRecord::Migration[6.0]
  def change
    add_column :salaries, :bank_acc_num, :string
    add_column :salaries, :bank_branch, :string
    add_column :salaries, :ifsc_code, :string
    add_column :salaries, :account_holder_name, :string
    add_column :salaries, :pan_number, :string
    add_column :salaries, :no_of_Working_days, :string
    add_column :salaries, :employee_id, :string
  end
end
