class User < ApplicationRecord
	acts_as_paranoid
  scope :all_users, -> { User.all }
  validates :name, :email, presence: true
end
