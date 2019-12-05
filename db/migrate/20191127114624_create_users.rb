class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.date :doj
      t.string :contact
      t.numeric :sal
      t.numeric :salpm
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :blood
      t.string :ename
      t.string :econtact
      t.string :pskill
      t.string :sskill1
      t.string :sskill2
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
