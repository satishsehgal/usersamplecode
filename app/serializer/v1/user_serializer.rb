# frozen_string_literal: true

class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end