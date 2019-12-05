class CreateSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :salaries do |t|
      t.numeric :basic_pay
      t.numeric :hra
      t.numeric :cca
      t.numeric :special_allowance
      t.numeric :transport_allowance
      t.numeric :reimbursement
      t.numeric :income_tax
      t.numeric :professional_tax
      t.numeric :loss_of_pay
      t.numeric :other_deductions

      t.timestamps
    end
  end
end
