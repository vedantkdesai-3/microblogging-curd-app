# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_follow, only: %i[show edit update destroy]
  before_action :logged_in_user, :auth_check

  # GET /follows or /follows.json
  def index
    @follows = Follow.where(following_user_id: logged_in_user.id)
  end

  # GET /follows/1 or /follows/1.json
  def show; end

  # GET /follows/new
  def new
    @follow = Follow.new
    set_following
  end

  # GET /follows/1/edit
  def edit; end

  # POST /follows or /follows.json
  def create
    @follow = Follow.new
    set_following
    @follow.user_id = logged_in_user.id
    if @follow.save
      redirect_to unfollowed_index_path, notice: 'Followed successfully.'
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @follow.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /follows/1 or /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1 or /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'User unfollowed successfully.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @follow = Follow.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def follow_params
    params.require(:follow).permit(:user_id, :following_user_id)
  end

  def set_following
    @follow.following_user_id = params[:format]
  end
end
