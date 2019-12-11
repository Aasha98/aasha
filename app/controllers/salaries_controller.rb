class SalariesController < ApplicationController
	def new
	@salary = Salary.new
	@user = User.find(session[:user_id])
	end

	def create
	@error
	@salary = Salary.new(salary_params)
	@salary.employee_id=session[:user_id]
	if @salary.no_of_leave_taken != nil
         @salary.loss_of_pay=(@salary.basic_pay / 30) * @salary.no_of_leave_taken
    end 
    @salary.gross = (@salary.basic_pay + @salary.hra + @salary.cca + @salary.reimbursement + @salary.special_allowance + @salary.transport_allowance)
    if (@salary.gross) >= 15000
    	@salary.professional_tax  = 200
    else
    	@salary.professional_tax = 0
    end
    
	if @salary.save
	redirect_to formone_path(session[:user_id])
	else
	@error = "Please check the input"
	render 'index'
	end

	end

	def edit
	@salary = Salary.find(params[:id])
	@user = User.find(params[:id])
	end

	def update
	 @salary = Salary.find(params[:id])
	 if @salary.update(salary_params)
	   redirect_to user_path(params[:id])
	 else
	  render 'edit'
	 end
	end

	private

	def salary_params
	params.require(:salary).permit(:basic_pay, :hra, :cca, :special_allowance, :transport_allowance, :reimbursement, :income_tax, :professional_tax, :loss_of_pay, :other_deductions,:bank_acc_num,:bank_branch,:ifsc_code,:account_holder_name,:pan_number,:no_of_Working_days,:employee_id,:gross,:net_pay)
	end
end
