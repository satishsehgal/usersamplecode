# frozen_string_literal: true

class V1::ApplicationController < ActionController::Base
  include ActionController::Serialization
  TOKEN_ERROR = "Invalid token!"

  def authenticate_token
    if auth_token == ENV["USER_MASTER_TOKEN"]
    	return true
    else
      render json: { error: TOKEN_ERROR }, status: :unauthorized
    end
  end

  private

  def auth_token
    request.headers["auth_token"]
  end
end
