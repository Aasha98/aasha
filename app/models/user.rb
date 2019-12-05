class User < ApplicationRecord
  has_secure_password
  validates :fname, presence:true, length: { maximum: 20 }, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :lname, presence:true, length: { maximum: 20 }, format: {with: /\A[a-zA-Z]+\z/}
  validates :ename, presence:true, length: { maximum: 20 }, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :contact, presence:true
  validates :contact, length: { minimum: 10, maximum: 10}
  validates :econtact, presence:true
  validates :econtact, length: { minimum: 10, maximum: 10}
  validates :email, presence:true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :age, presence:true, numericality: { greater_than_or_equal_to: 18}
  validates :pincode, presence:true, length:  { minimum: 6, maximum: 10}
  validates :doj, presence:true
end
