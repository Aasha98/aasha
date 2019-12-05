json.extract! user, :id, :fname, :lname, :age, :doj, :contact, :sal, :salpm, :address, :city, :state, :country, :pincode, :blood, :ename, :econtact, :pskill, :sskill1, :sskill2, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
