# frozen_string_literal: true

class V1::UsersController < V1::ApplicationController
  before_action :authenticate_token
  respond_to :json

  expose(:users) { User.all_users }
  expose(:user, scope: :without_deleted)

  #Get list of users
  def index
    respond_with users, root: :users, each_serializer: V1::UserSerializer
  end

  #Show user by id
  def show
  	respond_with user, root: :user, serializer: V1::UserSerializer
  end
end