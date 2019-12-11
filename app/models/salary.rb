class Salary < ApplicationRecord
validates :bank_branch, presence:true, length: { maximum: 20 }, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
end
