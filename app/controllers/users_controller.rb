class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to '/salaries/new', notice: 'User was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_salary_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
   @user = User.find(params[:id])
    @salary=Salary.find(params[:id])
    @hrac = hrac(@salary.basic_pay, @salary.hra)
    @ccac = ccac(@salary.basic_pay, @salary.cca) 
    @gross = @salary.basic_pay + @hrac + @ccac + @salary.reimbursement
    @itc = itc(@gross * 12)
    @ptc = ptc(@gross)
    @lopc = lopc(@salary.basic_pay,@salary.loss_of_pay)
    if @itc!=0
      @deduction = (@itc/12) + @ptc + @lopc + @salary.other_deductions
    else
      @deduction = @ptc + @lopc + @salary.other_deductions
    end
    @net = @gross - @deduction
    @salpm = @net
    @sal = @salpm* 12
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fname, :lname, :age, :doj, :contact, :sal, :salpm, :address, :city, :state, :country, :pincode, :blood, :ename, :econtact, :pskill, :sskill1, :sskill2, :email, :password, :password_confirmation)
    end
    
    def itc(sal)
      if sal <= 250000
      income_tax = 0
      elsif sal.between?(250001,500000)
      income_tax = (sal - 250000) * 0.05
      elsif sal.between?(500001,1000000)
      income_tax = 12500 + (0.20 * (sal - 500000))
      elsif sal > 1000000
      income_tax = 112500 + (0.30 * (sal - 1000000))
      end
      return income_tax
    end

    def ptc(salpm)
      professional_tax = 0
      if salpm >= 15000
      professional_tax = 200
      end 
      return professional_tax
    end

    def hrac(basic_pay, hr)
      hr = 0
      if hr != 0
      basic_pay * (hr/100)
    end
     return hr
    end

    def ccac(basic_pay, cc)
      cc = 0
      if cc != 0
      basic_pay*cc/100
    end
    return cc
    end

    def lopc(basic_pay, lop)
      lop = 0
      if lop != 0
      basic_pay/30 *lop
    end
    return lop
    end
end

