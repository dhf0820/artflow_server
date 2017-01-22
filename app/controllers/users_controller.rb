class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  after_action :verify_authorized

  # GET /users
  # GET /users.json
  def index
    authorize User, :index?
    @users = User.with_role(:admin)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user, :show?
  end

  # GET /users/new
  def new
    authorize User, :new?
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize @user, :edit?
  end

  # POST /users
  # POST /users.json
  def create
    authorize User, :create?
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        params[:roles].each do |user_role|
          @user.add_role(user_role)
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user, :update?
    user_data = user_params
    user_data.delete(:password) if user_params[:password].to_s.blank?
    user_data.delete(:password_confirmation) if user_params[:password].to_s.blank?
    
    respond_to do |format|
      if @user.update(user_data)
        @user.reset_roles
        params[:roles].each do |user_role|
          @user.add_role(user_role)
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
    authorize User, :destroy?
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :domain, :name, :employer_id,
        :phone_no, :address_line_1, :address_line_2, :address_line_3)
    end
end
