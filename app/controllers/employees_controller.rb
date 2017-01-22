class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  before_filter :authenticate_user!

  after_action :verify_authorized

  # GET /employees
  # GET /employees.json
  def index
    authorize User, :index?
    @employees = @user.employees
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    authorize @employee, :show?
  end

  # GET /employees/new
  def new
    authorize User, :new?
    @employee = User.new
  end

  # GET /employees/1/edit
  def edit
    authorize @employee, :edit?
  end

  # POST /employees
  # POST /employees.json
  def create
    authorize User, :create?
    @employee = User.new(employee_params)

    respond_to do |format|
      if @employee.save
        params[:roles].each do |user_role|
          @employee.add_role(user_role)
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    authorize @employee, :update?
    employee_data = employee_params
    employee_data.delete(:password) if employee_params[:password].to_s.blank?
    employee_data.delete(:password_confirmation) if employee_params[:password].to_s.blank?

    respond_to do |format|
      if @employee.update(employee_data)
        params[:roles].each do |user_role|
          @employee.add_role(user_role)
        end
        format.html { redirect_to @employee, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    authorize User, :destroy?
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = User.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:user).permit(:email, :password, :password_confirmation, :domain, :name, :employer_id)
    end
end
