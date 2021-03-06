# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :logged_in_user, :auth_check, except: %i[new create]
  before_action :check_owner, only: %i[update destroy]
  before_action :reset_session, except: %i[create edit show index]

  # GET /users or /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html { render }
      format.json { render json: @users, each_serializer: UserSerializer }
    end
  end

  # GET /users/1 or /users/1.json
  def show
    respond_to do |format|
      format.html { render }
      format.json { render json: @user, serializer: UserSerializer }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    session[:user_id] = nil
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def check_owner
    redirect_to users_url, alert: 'You are not authorized user!!!' if @user.id != logged_in_user.id
  end
end
