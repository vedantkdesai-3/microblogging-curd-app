# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]
  before_action :logged_in_user, :auth_check
  before_action :check_owner, only: %i[update destroy]

  # GET /microposts or /microposts.json
  def index
    @microposts = Micropost.joins(:user)
                           .includes(:user)
                           .where(user_id: Follow.where(user_id: logged_in_user.id).pluck(:following_user_id))
                           .or(Micropost.where(user: logged_in_user))
    respond_to do |format|
      format.html { render }
      format.json { render json: @microposts, each_serializer: MicropostSerializer }
    end
  end

  # GET /microposts/1 or /microposts/1.json
  def show
    respond_to do |format|
      format.html { render }
      format.json { render json: @micropost, serializer: MicropostSerializer }
    end
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit; end

  # POST /microposts or /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)
    update_user_id
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1 or /microposts/1.json
  def update
    update_user_id
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def update_user_id
    @micropost.user_id = logged_in_user.id
  end

  def check_owner
    redirect_to microposts_url, alert: 'You are not authorized user!!!' if @micropost.user_id != logged_in_user.id
  end
end