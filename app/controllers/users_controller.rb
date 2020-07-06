# frozen_string_literal: true

class UsersController < ApplicationController
  CREATE_SUCCESS = "User was successfully created."
  UPDATE_SUCCESS = "User was successfully updated."
  DESTROY_SUCCESS = "User was successfully destroyed."

  expose(:users) { User.all_users }
  expose(:user, scope: :without_deleted)
  
  # GET /users
  def index
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    new_user = User.new(user_params)
    if new_user.save
      redirect_to new_user, notice: CREATE_SUCCESS
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      redirect_to user, notice: UPDATE_SUCCESS
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
    redirect_to users_url, notice: DESTROY_SUCCESS
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :last_name)
    end
end
